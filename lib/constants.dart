library constants;

  const SEARCH_OPTION = [
    'RAE',
    'ing_esp',
    'fra_esp',
    'images'
  ];

  const SEARCH_OPTIONS_DATA = [
      {'name': 'RAE',     'emoji': '',             'baseUrl': 'https://dle.rae.es/'},
      {'name': 'ing_esp', 'emoji': '🇬🇧 \u21e8 🇪🇸', 'baseUrl': ''},
      {'name': 'fra_esp', 'emoji': '🇫🇷 \u21e8 🇪🇸', 'baseUrl': ''},
      {'name': 'images',  'emoji': '',            'baseUrl': 'https://serpapi.com/search.json?q=cats&tbm=isch&ijn=0'}
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

  //  ----------  Google Custom Search Images Properties  -----------
  //  API GOOGLE SEARCH KEY : AIzaSyBcFGWqMqEcImatg_ngrnDvhRsY8mebAwc
  //  https://www.googleapis.com/customsearch/v1?key=AIzaSyBcFGWqMqEcImatg_ngrnDvhRsY8mebAwc&cx=006849220809110245321:7uhca5okrma&q=lectures&searchType=image&imgSize=xlarge&alt=json
  const GOOGLE_CUSTOM_SEARCH = {
    'baseUrl'               : 'https://www.googleapis.com/customsearch/v1?',
    'apiKey'                : 'key=AIzaSyBcFGWqMqEcImatg_ngrnDvhRsY8mebAwc',
    'cx'                    : 'cx=006849220809110245321:7uhca5okrma',
    'query'                 : 'q=#query',
    'searchType'            : 'searchType=image',
    'imageSize'             : 'imgSize=medium',
    'altJson'               : '&alt=json',
    'imagesJsonElementName' : 'items'
  };

