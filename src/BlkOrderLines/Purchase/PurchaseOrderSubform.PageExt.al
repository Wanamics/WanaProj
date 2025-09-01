namespace Wanamics.WanaProj.BlkOrderLines;
using Microsoft.Purchases.Document;
pageextension 87591 "wan Purchase Order Subform" extends "Purchase Order Subform"
{
    actions
    {
        addfirst(processing)
        {
            action(wanInsertBlanketOrderLines)
            {
                ApplicationArea = All;
                Caption = 'Insert Blanket Order Lines';
                Ellipsis = true;
                Image = BlanketOrder;
                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"wan Purch. Lines Copy BlkOrder", Rec);
                end;
            }
        }
    }
}
