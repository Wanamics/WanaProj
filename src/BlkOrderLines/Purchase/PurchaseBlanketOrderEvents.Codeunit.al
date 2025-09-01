namespace WanaProj.WanaProj;

using Microsoft.Inventory.Item.Catalog;
using Microsoft.Inventory.Item;
using Microsoft.Purchases.Document;

codeunit 87502 "wan Purch Blanket Order Events"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Reference Management", OnAfterPurchItemItemRefNotFound, '', false, false)]
    local procedure OnAfterPurchItemItemRefNotFound(var PurchaseLine: Record "Purchase Line"; var ItemVariant: Record "Item Variant")
    begin
    end;

    local procedure OnBeforeFillDescription(var PurchaseLine: Record "Purchase Line"; var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;
}
