String getMainImagePath(String id, bool hasMainImage) {
  if (hasMainImage) {
    return 'assets/project/main_image/main_image_$id.jpg';
  } else {
    return 'assets/project/main_image/main_image_placeholder.jpg';
  }
}
