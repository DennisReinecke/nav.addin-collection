controladdin InlineFileAddIn {
    RequestedWidth = 600;
    MinimumHeight = 600;
    RequestedHeight = 600;
    VerticalStretch = true;
    HorizontalStretch = true;
    Scripts =  
        'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js',
        'addin/inlineFile/js/inlineFile.js';
    StartupScript = 'addin/startup.js';
    

    event OnControlAddInReady();
    
    procedure CreateInlineFile(Src: Text);
    procedure SetSize(Height: Text; Width: Text);
}