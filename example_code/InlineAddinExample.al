page 50000 "IF Inline File Example"
{
    PageType = Card;
    SourceTable = "Incoming Document Attachment";

    layout
    {
        area(content)
        {
            usercontrol(InlineFileView; InlineFileAddIn)
            {
                ApplicationArea = All;
                trigger OnControlAddInReady()
                var
                    TmpBlob: Codeunit "Temp Blob";
                    Base64Convert: Codeunit "Base64 Convert";
                    IStream: InStream;
                begin
                    TmpBlob.FromRecord(Rec, 8);
                    TmpBlob.CreateInStream(IStream);
                    CurrPage.InlineFileView.CreateInlineFile(StrSubstNo('data:%1;base64,%2', GetContentType(), Base64Convert.ToBase64(IStream)));
                end;
            }
        }
    }

    local procedure GetContentType(): Text
    begin
        case Rec.Type of
            Rec.Type::PDF:
                exit('application/pdf');
            else
                Error('File Type "%1" is not supported');
        end;
    end;
}

pageextension 50001 "IF Inc. Doc. Attach. FactBox" extends "Incoming Doc. Attach. FactBox"
{
    actions
    {
        addfirst(Processing)
        {
            action(InlineAddInDemo)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    IncomingDocumentAttachment: Record "Incoming Document Attachment";
                begin
                    IncomingDocumentAttachment.Get(Rec."Incoming Document Entry No.", Rec."Line No.");
                    Page.Run(Page::"IF Inline File Example", IncomingDocumentAttachment);
                end;
            }
        }
    }
}