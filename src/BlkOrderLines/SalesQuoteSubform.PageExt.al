namespace Wanamics.WanaProj.BlkOrderLines;

using Microsoft.Sales.Document;
pageextension 87573 "wan Sales Quote Lines BlkOrder" extends "Sales Quote Subform"
{
    actions
    {
        addfirst(processing)
        {
            action(wanSelectBlanketOrderLines)
            {
                ApplicationArea = All;
                Caption = 'Select Blanket Order Lines';
                Ellipsis = true;
                Image = BlanketOrder;
                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"wan Sales Lines Copy BlkOrder", Rec);
                end;
            }
        }
    }
}
