inherited TLogin: TTLogin
  Title = 'Login Estudos'
  DesignLeft = 2
  DesignTop = 2
  object edUsuario: TIWEdit [0]
    Left = 72
    Top = 80
    Width = 200
    Height = 32
    OnHTMLTag = edUsuarioHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edUsuario'
    SubmitOnAsyncEvent = True
  end
  object edSenha: TIWEdit [1]
    Left = 72
    Top = 128
    Width = 200
    Height = 32
    OnHTMLTag = edSenhaHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edSenha'
    SubmitOnAsyncEvent = True
    TabOrder = 1
    DataType = stPassword
  end
  object BTNLOGIN: TIWButton [2]
    Left = 72
    Top = 184
    Width = 81
    Height = 30
    Caption = 'Login'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNLOGIN'
    TabOrder = 2
    OnAsyncClick = BTNLOGINAsyncClick
  end
  object btnRecuperar: TIWButton [3]
    Left = 189
    Top = 184
    Width = 83
    Height = 30
    Caption = 'Recuperar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'btnRecuperar'
    TabOrder = 3
    OnAsyncClick = btnRecuperarAsyncClick
  end
end
