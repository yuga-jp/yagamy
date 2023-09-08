String emptyToThumbnailPlaceholderUrl(String url) {
  if (url.isNotEmpty) {
    return url;
  } else {
    return 'https://yagamy-thumbnail.s3.ap-northeast-1.amazonaws.com/thumbnail_placeholder.png';
  }
}
