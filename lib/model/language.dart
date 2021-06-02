
class Language {
  final String name;
  final String languageCode;

  Language (this.name,this.languageCode);

  static List<Language> choicelist(){
    return <Language>[
      Language('English', 'en'),
      Language('Hindi','hi') ,
      Language('spanish','es'),
      Language('Italian','it'),
      Language('Chinese','zh'),
      Language('Arebic', 'ar')
    ];
  }
}