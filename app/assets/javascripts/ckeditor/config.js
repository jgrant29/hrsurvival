CKEDITOR.editorConfig = function( config )
{
  // Define changes to default configuration here. For example:
  // config.language = 'fr';
  // config.uiColor = '#AADC6E';

  /* Filebrowser routes */
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed.

   config.filebrowserBrowseUrl = "/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";

  // The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";

  // The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";

  // The location of a script that handles file uploads.
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";

  config.allowedContent = true;

  // Rails CSRF token
  config.filebrowserParams = function(){
    var csrf_token, csrf_param, meta,
        metas = document.getElementsByTagName('meta'),
        params = new Object();

    for ( var i = 0 ; i < metas.length ; i++ ){
      meta = metas[i];

      switch(meta.name) {
        case "csrf-token":
          csrf_token = meta.content;
          break;
        case "csrf-param":
          csrf_param = meta.content;
          break;
        default:
          continue;
      }
    }

    if (csrf_param !== undefined && csrf_token !== undefined) {
      params[csrf_param] = csrf_token;
    }

    return params;
  };

  config.addQueryString = function( url, params ){
    var queryString = [];

    if ( !params ) {
      return url;
    } else {
      for ( var i in params )
        queryString.push( i + "=" + encodeURIComponent( params[ i ] ) );
    }

    return url + ( ( url.indexOf( "?" ) != -1 ) ? "&" : "?" ) + queryString.join( "&" );
  };

  // Integrate Rails CSRF token into file upload dialogs (link, image, attachment and flash)
  CKEDITOR.on( 'dialogDefinition', function( ev ){
    // Take the dialog name and its definition from the event data.
    var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
    var content, upload;

    if (CKEDITOR.tools.indexOf(['link', 'image', 'attachment', 'flash'], dialogName) > -1) {
      content = (dialogDefinition.getContents('Upload') || dialogDefinition.getContents('upload'));
      upload = (content == null ? null : content.get('upload'));

      if (upload && upload.filebrowser && upload.filebrowser['params'] === undefined) {
        upload.filebrowser['params'] = config.filebrowserParams();
        upload.action = config.addQueryString(upload.action, upload.filebrowser['params']);
      }
    }
  });

  // Toolbar groups configuration.
  config.toolbar = [
    { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source'] },
    { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
    // { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
    // { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
    { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
    { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'SpecialChar' ] },
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
    '/',
    { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] }

  ];

  config.toolbar_mini = [
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
    { name: 'styles', items: [ 'Font', 'FontSize' ] },
    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
    { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] }
  ];

  CKEDITOR.stylesSet.add('publishing', [

    { name : '1 sub'      , element : 'h2', attributes : { 'class' : 'one'}  },
    { name : '1 text'     , element : 'p', attributes : { 'class' : 'one'}  },
    { name : 'Quote 1'      , element : 'p', attributes : { 'class' : 'quote one'} },
  
    { name : '2 sub'        , element : 'h3', attributes : { 'class' : 'two'}   },
    { name : '2 text',
      element : 'p',
      attributes : { 'class' : 'two'},
      styles : {'font-weight' : 'normal'},
      },
    { name : '2 note',
      element : 'p',
      attributes : { 'class' : 'two note noafter'},
      styles : {'font-weight' : 'bold'},
    },
  
    { name : '3 sub'      , element : 'h4', attributes : { 'class' : 'three'}   },
    { name : '3 text',
      element : 'p',
      attributes : { 'class' : 'three'},
      styles : {'font-weight' : 'normal'},
      },
    { name : '3 note',
      element : 'p',
      attributes : { 'class' : 'three note noafter'},
      styles : {'font-weight' : 'bold'},
    },
    { name : '4 sub'      , element : 'h5', attributes : { 'class' : 'four'}   },
    { name : '4 text'     , element : 'p', attributes : { 'class' : 'four'}  },
    { name : '4 note',
      element : 'p',
      attributes : { 'class' : 'four note noafter'},
      styles : {'font-weight' : 'bold'},
    },
    { name : '5 sub'      , element : 'h6', attributes : { 'class' : 'five'}   },
    { name : '5 text'     , element : 'p', attributes : { 'class' : 'five'}  },
  
    { name : '6 text'     , element : 'p', attributes : { 'class' : 'six'}  },
  
    { name : 'policy level'   , element : 'p', attributes : { 'class' : 'policy'}  },
    { name : 'sample title'   , element : 'h2', attributes : { 'class' : 'sample-title'}  },
    { name : 'sample text'    , element : 'p', attributes : { 'class' : 'sample-text'}  },
    { name : 'forms heading'  , element : 'h2', attributes : { 'class' : 'forms-heading'}  },
  
    /* Inline Styles */
    { name : 'simple',
      element : 'span',
      attributes : { 'class' : 'simple'},
    },
  
  
    /* Object Styles */
    { name : 'bullet',
      element : 'li',
      attributes : { 'class' : ''},
      styles : {'font-weight' : 'normal'},
    },
    { name : 'bullet bold no after',
      element : 'li',
      attributes : { 'class' : 'bold noafter'},
      styles : {'font-weight' : 'bold'},
    },
    { name : 'bullet no bullet',
      element : 'li',
      attributes : { 'class' : 'no-bullet'},
      styles : {'font-weight' : 'normal'},
    },
    { name : '1 list',
      element : 'ul',
      attributes : { 'class' : 'one'},
    },
    { name : '2 list',
      element : 'ul',
      attributes : { 'class' : 'two'},
    },
    { name : '3 list',
      element : 'ul',
      attributes : { 'class' : 'three'},
    },
    { name : '4 list',
      element : 'ul',
      attributes : { 'class' : 'four'},
    },
    { name : '5 list',
      element : 'ul',
      attributes : { 'class' : 'five'},
    },
    { name : 'square list',
      element : 'ul',
      attributes : { 'class' : 'square'},
    },
    { name : 'check list',
      element : 'ul',
      attributes : { 'class' : 'check'},
    },
    { name : 'x list',
      element : 'li',
      attributes : { 'class' : 'x'},
    },
    { name : 'circle list',
      element : 'li',
      attributes : { 'class' : 'circle'},
    },
    { name : 'table - all borders',
      element : 'table',
      attributes : { 'class' : 'all'},
    },
    { name : 'table - row borders',
      element : 'table',
      attributes : { 'class' : 'row'},
    },
    { name : 'table - column borders',
      element : 'table',
      attributes : { 'class' : 'column'},
    },
    { name : 'table - no borders',
      element : 'table',
      attributes : { 'class' : ''},
    },
  ]);
config.stylesSet = 'publishing';
};

