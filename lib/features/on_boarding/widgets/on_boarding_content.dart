class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Buka Toko Kamu Sekarang",
    image: "assets/images/on_boarding/on_boarding1.svg",
    desc: "Jelajahi lowongan pekerjaan, beasiswa, serta kursus & bootcamp untuk meningkatkan keterampilan dan memperluas peluang kariermu.",
  ),
  OnboardingContents(
    title: "Siap Bersaing di Dunia Kerja?",
    image: "assets/images/on_boarding/on_boarding2.svg",
    desc: "Tingkatkan kepercayaan diri dengan simulasi wawancara AI dan dapatkan konsultasi HRD agar lebih siap menghadapi dunia kerja.",
  ),
  OnboardingContents(
    title: "Terhubung & Mulai Sekarang!",
    image: "assets/images/on_boarding/on_boarding3.svg",
    desc: "Diskusi, berbagi insight, dan bangun koneksi dengan profesional. ",
  ),
];