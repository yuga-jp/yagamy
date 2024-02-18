String getTumbnailPath(String id, bool hasThumbnail) {
  if (hasThumbnail) {
    return 'assets/project/thumbnail/thumbnail_$id.jpg';
  } else {
    return 'assets/project/thumbnail/thumbnail_placeholder.jpg';
  }
}
