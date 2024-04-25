page 50103 "Henrique App Setup"
{
    ApplicationArea = All;
    Caption = 'Henrique App Setup';
    PageType = Card;
    SourceTable = HenriqueAppSetup;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(SerialNo; Rec.SerialNo)
                {
                    Caption = 'Serial No';
                    ToolTip = 'Specifies the value of the Serial No field.';
                }
                field(SerialNoPosted; Rec.SerialNoPosted)
                {
                    Caption = 'Serial No Posted';
                    ToolTip = 'Specifies the value of the Serial No Posted field.';
                }
            }
        }

    }
    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

}
