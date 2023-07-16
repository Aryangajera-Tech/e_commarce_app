class PopularModel {
  final String picture;
  final String title;
  final String desc;
  final int price;

  PopularModel({
    required this.picture,
    this.desc =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras convallis nisl dolor.Aliquam nisi ligula, venenatis vel ex luctus, aliquam tristique nibh. Nullam eu pellentesque orci, vitae mollis neque. Duis ut purus vel dui aliquet tempor ac sed lacus. Proin sed ante vel ligula cursus rhoncus.',
    required this.price,
    required this.title,
  });
}
