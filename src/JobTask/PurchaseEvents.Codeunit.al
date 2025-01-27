namespace Wanamics.WanaProj.JobTask;

using Microsoft.Purchases.Document;
codeunit 87580 "wan Purchase Events JobTask"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterInitHeaderDefaults, '', false, false)]
    local procedure OnAfterInitHeaderDefaults(var PurchLine: Record "Purchase Line"; PurchHeader: Record "Purchase Header"; TempPurchLine: Record "Purchase Line" temporary)
    begin
        PurchLine."Job No." := PurchHeader."wan Job No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnValidateNoOnBeforeJobTaskIsSet, '', false, false)]
    local procedure OnValidateNoOnBeforeJobTaskIsSet(PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line"; TempPurchaseLine: Record "Purchase Line" temporary; IsHandled: Boolean)
    begin
        PurchaseLine.Validate("Job No.");
    end;
}
