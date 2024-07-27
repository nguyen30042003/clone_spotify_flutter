
const linkAssets = 'assets/vectors/';
const linkImageAssets = 'assets/images/';
class AppVectorsAndImages{
  static String getLinkImage(String name) => '$linkImageAssets${name.replaceAll(' ', '').toLowerCase()}.png';
  static String getLinkVector(String name) => '$linkAssets${name.replaceAll(' ', '').toLowerCase()}.svg';
  static String getLinkImageFirebase(String name) {
    print(name);
    return "https://firebasestorage.googleapis.com/v0/b/spotify-f6558.appspot.com/o/cover_song%2F" +
        name
        + ".jpg?alt=media";
  }
  static String getMusicFirebase(String name){
    print(name);
    return "https://firebasestorage.googleapis.com/v0/b/spotify-f6558.appspot.com/o/songs%2F" +
        name
        + ".mp3?alt=media";
  }
}
