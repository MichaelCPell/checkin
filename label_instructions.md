var final_printer;

var my_label;

// loads all supported printers into a combo box 
function loadPrinters()
{
    var printers = dymo.label.framework.getPrinters();
    if (printers.length == 0)
    {
        alert("No DYMO printers are installed. Install DYMO printers.");
        return;
    }

    for (var i = 0; i < printers.length; i++)
    {
        var printer = printers[i];
        if (printer.printerType == "LabelWriterPrinter")
        {
            final_printer = printer.name;
        }
    }
}


$.get("just_name.label", function(labelXml)
{
    my_label = dymo.label.framework.openLabelXml(labelXml);
}, "text");


my_label.setObjectText("TEXT", "JOHN SMITH")

