namespace Wanamics.WanaProj.JobTask;

using Microsoft.Sales.Document;
codeunit 87560 "wan Sales Events JobTask"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterInitHeaderDefaults, '', false, false)]
    local procedure OnAfterInitHeaderDefaults(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header"; xSalesLine: Record "Sales Line")
    begin
        SalesLine."Job No." := SalesHeader."wan Job No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnValidateNoOnAfterCreateDimFromDefaultDim, '', false, false)]
    local procedure OnValidateNoOnAfterCreateDimFromDefaultDim(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header"; CallingFieldNo: Integer)
    begin
        SalesLine.Validate("Job No.");
    end;
}
