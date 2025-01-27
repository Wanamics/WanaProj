namespace Wanamics.WanaProj.JobTask;

using Microsoft.Purchases.Document;
using Microsoft.Projects.Project.Job;
tableextension 87580 "wan Purch. Header JobTask" extends "Purchase Header"
{
    fields
    {
        field(87501; "wan Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = ToBeClassified;
            TableRelation = Job;
            trigger OnValidate()
            var
                Line: Record "Purchase Line";
                ConfirmMsg: Label 'Do you want to update %1 on all the lines?';
            begin
                TestStatusOpen();
                if GetHideValidationDialog() or not GuiAllowed then
                    exit;
                Line.SetRange("Document Type", "Document Type");
                Line.SetRange("Document No.", "No.");
                Line.SetFilter(Type, '<>%1', Line.Type::" ");
                if Line.IsEmpty then
                    exit;
                if not Confirm(ConfirmMsg, false, FieldCaption("wan Job No.")) then
                    exit;
                Line.LockTable();
                if Line.Find('-') then
                    repeat
                        Line.Validate("Job No.", Rec."wan Job No.");
                        Line.Modify();
                    until Line.Next() = 0;
            end;
        }
    }
}
