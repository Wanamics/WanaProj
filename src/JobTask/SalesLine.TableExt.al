namespace Wanamics.WanaProj.JobTask;

using Microsoft.Sales.Document;
using Microsoft.Projects.Project.Job;
tableextension 87561 "wan Sales Line" extends "Sales Line"
{
    fields
    {
        modify("Job No.")
        {
            trigger OnAfterValidate()
            var
                JobTask: Record "Job Task";
            begin
                if ("Job No." <> '') and ("Job Task No." = '') then
                    if JobTask.wanGetDefault("Job No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code") then
                        Validate("Job Task No.", JobTask."Job Task No.");
            end;
        }
    }
}
