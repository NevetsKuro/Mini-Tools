$(function () {
    var originalValue = $.ui.igTextEditor.prototype.value;
    $.widget("ui.igTextEditor", $.extend({}, $.ui.igTextEditor.prototype, {
        value: function () {
            if ((val = originalValue.apply(this, arguments))) {
                return this.options.outputTemplate.replace("{0}", val);
            }
            return val;
        }
    }));

    $("#barcode").hide();
    $("#generateBC").click(function (evt) {
        evt.preventDefault();

        var barcodeN = "",
            barcodeFN = "",
            beginVCard = "BEGIN:VCARD\r\nVERSION:2.1\r\n",
            endVCard = "END:VCARD";


        var prefix = $("#textEditor").igTextEditor("text");
        var firstName = $("#textEditor1").igTextEditor("text");
        var middleName = $("#textEditor2").igTextEditor("text");
        var secondName = $("#textEditor3").igTextEditor("text");
        var street = $("#textEditor13").igTextEditor("text");
        var city = $("#textEditor14").igTextEditor("text");
        var state = $("#textEditor15").igTextEditor("text");
        var country = $("#textEditor12").igTextEditor("text");
        var zipcode = $("#textEditor16").igTextEditor("text");

        if (prefix != "" || prefix != null) {
            if (middleName != "" || middleName != null) {
                barcodeN = "N:" + secondName + ";" + middleName + ";" + firstName + ";" + prefix + "\r\n";
                barcodeFN = "FN" + prefix + firstName + " " + middleName + " " + secondName + "\r\n";
            } else {
                barcodeN = "N:" + secondName + ";" + firstName + ";" + prefix + "\r\n";
                barcodeFN = "FN" + prefix + firstName + " " + secondName + "\r\n";
            }
        } else {
            if (middleName != "" || middleName != null) {
                barcodeN = "N:" + secondName + ";" + middleName + ";" + firstName + "\r\n";
                barcodeFN = "FN" + firstName + " " + middleName + " " + secondName + "\r\n";
            } else {
                barcodeN = "N:" + secondName + ";" + firstName + "\r\n";
                barcodeFN = "FN" + firstName + " " + secondName + "\r\n";
            }
        }
        var address = "ADR;WORK:;";
        var array = [street, city, state, country, zipcode];
        for (var i = 0; i < array.length; i++) {
            if (array[i] != "") {
                address += ";" + array[i];
            } else {
                address += ";";
            }
        }
        address = address.concat("\r\n");

        barcode = beginVCard;
        barcode = barcode.concat(barcodeN, barcodeFN, address);

        $(".output").each(function () {
            barcode += $(this).igTextEditor("value");
        });

        barcode = barcode.concat(endVCard);
                if ($("#textEditor1").igTextEditor("isValid") == true && $("#textEditor3").igTextEditor("isValid") == true) {
            $("#barcode").igQRCodeBarcode("option", "data", barcode);
            $("#barcode").show();
        }

    });

    //Configuring the barcode for the business card
    $("#barcode").igQRCodeBarcode({
        height: "200px",
        width: "200px",
        barsFillMode: "ensureEqualSize",
        errorCorrectionLevel: "low",
        xDimension: 0.75,
        data: "BEGIN:VCARD\r\nVERSION:2.1\r\nN:Somebody\r\nFN:Somebody\r\nORG:Organization's name\r\nTITLE:Job title\r\nTEL;TYPE=cell:555555555\r\nEMAIL;PREF;INTERNET:example@example.com\r\nEND:VCARD"
    });

    //Configuring the text editors 
    $('#textEditor').igTextEditor({
        width: 220
    });

    $('#textEditor1').igTextEditor({
        width: 220,
        required: true
    });
    $('#textEditor2').igTextEditor({
        width: 220
    });
    $('#textEditor3').igTextEditor({
        width: 220,
        required: true
    });

    $('#textEditor4').igTextEditor({
        width: 220,
        outputTemplate: "EMAIL;INTERNET:{0}\r\n"
    });
    $('#textEditor5').igTextEditor({
        width: 220,
        outputTemplate: "TEL;HOME;VOICE:{0}\r\n"
    });
    $('#textEditor6').igTextEditor({
        width: 220,
        outputTemplate: "TEL;CELL;VOICE:{0}\r\n"
    });
    $('#textEditor7').igTextEditor({
        width: 220,
        outputTemplate: "ORG:{0}\r\n"
    });
    $('#textEditor8').igTextEditor({
        width: 220,
        outputTemplate: "TITLE:{0}\r\n"
    });
    $('#textEditor9').igTextEditor({
        width: 220,
        outputTemplate: "EMAIL;PREF;INTERNET:{0}\r\n"
    });
    $('#textEditor10').igTextEditor({
        width: 220,
        outputTemplate: "TEL;WORK;VOICE:{0}\r\n"
    });
    $('#textEditor11').igTextEditor({
        width: 220,
        outputTemplate: "URL:{0}\r\n"
    });
    $('#textEditor12').igTextEditor({
        width: 220
    });
    $('#textEditor13').igTextEditor({
        width: 220
    });
    $('#textEditor14').igTextEditor({
        width: 220
    });
    $('#textEditor15').igTextEditor({
        width: 220
    });
    $('#textEditor16').igTextEditor({
        width: 220
    });
    $('#textEditor17').igTextEditor({
        width: 220,
        outputTemplate: "TEL;FAX;VOICE:{0}\r\n"
    });
    $('#textEditor18').igTextEditor({
        width: 220,
        outputTemplate: "URL;HOME:{0}\r\n"
    });

    $("#submit").click(function () {
        var dimension = $('input[name="dimension"]').val();
        $("#barcode").igQRCodeBarcode("option", "width", dimension);
        $("#barcode").igQRCodeBarcode("option", "height", dimension);

    });
});