<?php
include ("class_file_upload.php");
ini_set("memory_limit", "64M");
set_time_limit(60);

class Foto_upload extends file_upload {
  
  var $x_size;
  var $y_size;
  var $x_max_size = 300;
  var $y_max_size = 200;
  var $x_max_thumb_size = 110;
  var $y_max_thumb_size = 88;
  var $thumb_folder;
  var $larger_dim;
  var $larger_curr_value;
  var $larger_dim_value;
  var $larger_dim_thumb_value;

  var $use_image_magick = false; // switch between true and false
  // I suggest to use ImageMagick on Linux/UNIX systems, it works on windows too, but it's hard to configurate
  // check your existing configuration by your web hosting provider
  
  function upload($to_name = "", $landscape_only = false,$create_thumb = false,$delete_tmp_file = false,$compression = 85) {
    $new_name = $this->set_file_name($to_name);
    if ($this->check_file_name($new_name)) {
      if ($this->validateExtension()) {
        if (is_uploaded_file($this->the_temp_file)) {
          $this->file_copy = $new_name;
          if ($this->process_image($landscape_only,$create_thumb,$delete_tmp_file,$compression)) {
            if ($this->move_upload($this->the_temp_file, $this->file_copy)) {
              $this->message[] = $this->error_text($this->http_error);
              if ($this->rename_file) $this->message[] = $this->error_text(16);
              return true;
            }
          } else {
            return false;
          }
        } else {
          $this->message[] = $this->error_text($this->http_error);
          return false;
        }
      } else {
        $this->show_extensions();
        $this->message[] = $this->error_text(11);
        return false;
      }
    } else {
      return false;
    }
  }

  function process_image($landscape_only = false, $create_thumb = false, $delete_tmp_file = false, $compression = 85) {

    if ($landscape_only) {
      $this->get_img_size($this->the_temp_file);
      if ($this->y_size > $this->x_size) {
        $this->the_temp_file = $this->img_rotate($this->the_temp_file);
      }
    }
    
    $this->check_dimensions($this->the_temp_file); // check which size is longer then the max value
    if ($this->larger_curr_value > $this->larger_dim_value) {
      $this->message[] = "Die ausgew&auml;hlte Datei ist zu groß (Abmessungen)!";
      return false;
    }
    
    if ($create_thumb) {
      if ( $this->thumb_folder != "" ) {
        $this->check_dir($this->thumb_folder);
      }
      if ( $this->thumb_folder == $this->upload_dir ) {
        $this->thumb_folder = $this->upload_dir."small/";
      }
      $thumb = $this->thumb_folder.$this->file_copy;
    
      if ($this->larger_curr_value > $this->larger_dim_thumb_value) {
        $this->thumbs($this->the_temp_file, $thumb, $this->larger_dim_thumb_value, $compression); // finally resize the image
      } else {
        $this->move_upload($this->the_temp_file, $thumb);
      }
    }
    return true;
  }
  function get_img_size($file) {
    $img_info = getimagesize ( $file );
    $this->x_size = $img_info[0];
    $this->y_size = $img_info[1];
  }
  function check_dimensions($file) {
    $this->get_img_size($file);
    $x_check = $this->x_size - $this->x_max_size;
    $y_check = $this->y_size - $this->y_max_size;
    if ($x_check < $y_check) {
      $this->larger_dim = "y";
      $this->larger_curr_value = $this->y_size;
      $this->larger_dim_value = $this->y_max_size;
      $this->larger_dim_thumb_value = $this->y_max_thumb_size;
    } else {
      $this->larger_dim = "x";
      $this->larger_curr_value = $this->x_size;
      $this->larger_dim_value = $this->x_max_size;
      $this->larger_dim_thumb_value = $this->x_max_thumb_size;
    }
  }
  function img_rotate($file) {
    $new_x = $this->y_size;
    $new_y = $this->x_size;

    $rot_img = imagerotate($file, 90, 0);
    $new_img = imagecreatetruecolor($new_x, $new_y);
    imageantialias($new_img, TRUE);
    imagecopyresampled($new_img, $rot_img, 0, 0, 0, 0, $new_x, $new_y, $new_x, $new_y);
    return $new_img;
  }
  function thumbs($file, $file_name_dest, $target_size, $quality = 80) {
    //print_r(func_get_args());
    $size = getimagesize($file);
    if ($this->larger_dim == "x") {
      $w = number_format($target_size, 0, ',', '');
      $h = number_format(($size[1]/$size[0])*$target_size,0,',','');   echo "a";
    } else {
      $h = number_format($target_size, 0, ',', '');
      $w = number_format(($size[0]/$size[1])*$target_size,0,',','');   echo "b";
    }

    $dest = imagecreatetruecolor($w, $h);
    imageantialias($dest, TRUE);
    $src = $file;
    imagecopyresampled($dest, $src, 0, 0, 0, 0, $w, $h, $size[0], $size[1]);
    imagejpeg($dest, $file_name_dest, $quality);
  }
}
