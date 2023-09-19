String emptyToMainImagePlaceholderUrl(String url) {
  if (url.isNotEmpty) {
    return url;
  } else {
    return 'https://yagamy-main-image.s3.ap-northeast-1.amazonaws.com/main_image_placeholder.png';
  }
}
