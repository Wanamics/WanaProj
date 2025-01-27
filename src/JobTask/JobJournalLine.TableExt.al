namespace Wanamics.WanaProj.JobTask;

using Microsoft.Projects.Project.Journal;
using Microsoft.Projects.Project.Job;
tableextension 87502 "wan Job Journal Line" extends "Job Journal Line"
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
