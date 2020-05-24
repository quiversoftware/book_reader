class SearchingOptions {
  var _options;

  SearchingOptions(){
    this._options = [
      {'name': 'RAE',       'emoji': '',            'url': ''},
      {'name': 'ing_esp',   'emoji': '🇬🇧 \u21e8 🇪🇸', 'url': ''},
      {'name': 'fra_esp',   'emoji': '🇫🇷 \u21e8 🇪🇸', 'url': ''},
      {'name': 'Sinónimos', 'emoji': '',            'url': ''}
    ];
  }

  get options => _options;
}