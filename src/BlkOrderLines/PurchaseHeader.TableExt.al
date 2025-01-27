namespace Wanamics.WanaProj.BlkOrderLines;

using Microsoft.Purchases.Document;
tableextension 87590 "wan Purch. Header BlkOrder" extends "Purchase Header"
{
    fields
    {
        field(87500; "wan Blanket Order No."; Code[20])
        {
            Caption = 'Blanket Order No.';
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));
            trigger OnLookup()
            var
                BlanketOrder: Record "Purchase Header";
            begin
                BlanketOrder.SetRange("Document type", BlanketOrder."Document Type"::"Blanket Order");
                BlanketOrder.SetRange("Buy-from Vendor No.", Rec."Buy-from Vendor No.");
                if Page.RunModal(Page::"wan Purchase BlkOrder Lookup", BlanketOrder) = Action::LookupOK then
                    "wan Blanket Order No." := BlanketOrder."No.";
            end;
        }
    }
}
