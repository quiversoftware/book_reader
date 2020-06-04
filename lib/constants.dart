library constants;

  const SEARCH_OPTION = [
    'RAE',
    'ing_esp',
    'fra_esp',
    'sinonimo'
  ];

  const SEARCH_OPTIONS_DATA = [
      {'name': 'RAE',       'emoji': '',             'baseUrl': 'https://dle.rae.es/'},
      {'name': 'ing_esp',   'emoji': '🇬🇧 \u21e8 🇪🇸', 'baseUrl': ''},
      {'name': 'fra_esp',   'emoji': '🇫🇷 \u21e8 🇪🇸', 'baseUrl': ''},
      {'name': 'sinonimo', 'emoji': '',            'baseUrl': ''}
    ];

  //RAE constants
  const RAE = {
    'resultsClassName'      : 'resultados',
    'definitionTagName'     : 'article',
    'definitionsBloc'       : 0,
    'conjugationsBloc'      : 1,
    'definitionsClassName'  : 'j',
    'warningMessage'        : 'La palabra {} no está en el Diccionario'
  };

