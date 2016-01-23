
<footer>
    <div class="">
        <p class="pull-right">Islington College Lead Management System by |
            <span> <i class="fa fa-spinner"></i> Ella Productions</span>
        </p>
    </div>
    <div class="clearfix"></div>
</footer>
<!-- /footer content -->

</div>
<!-- /page content -->
</div>

</div>

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>

<script src="/LeadManagement/resources/js/bootstrap.min.js"></script>

<!-- chart js -->
<script src="/LeadManagement/resources/js/chartjs/chart.min.js"></script>
<!-- bootstrap progress js -->
<script src="/LeadManagement/resources/js/progressbar/bootstrap-progressbar.min.js"></script>
<script src="/LeadManagement/resources/js/nicescroll/jquery.nicescroll.min.js"></script>
<!-- icheck -->
<script src="/LeadManagement/resources/js/icheck/icheck.min.js"></script>

<script src="/LeadManagement/resources/js/custom.js"></script>
<!-- form validation -->
<script src="/LeadManagement/resources/js/validator/validator.js"></script>



<script>
    // initialize the validator function
    validator.message['date'] = 'not a real date';

    // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
    $('form')
            .on('blur', 'input[required], input.optional, select.required', validator.checkField)
            .on('change', 'select.required', validator.checkField)
            .on('keypress', 'input[required][pattern]', validator.keypress);

    $('.multi.required')
            .on('keyup blur', 'input', function () {
                validator.checkField.apply($(this).siblings().last()[0]);
            });

    // bind the validation to the form submit event
    //$('#send').click('submit');//.prop('disabled', true);

    $('form').submit(function (e) {
        e.preventDefault();
        var submit = true;
        // evaluate the form using generic validaing
        if (!validator.checkAll($(this))) {
            submit = false;
        }

        if (submit)
            this.submit();
        return false;
    });

    /* FOR DEMO ONLY */
    $('#vfields').change(function () {
        $('form').toggleClass('mode2');
    }).prop('checked', false);

    $('#alerts').change(function () {
        validator.defaults.alerts = (this.checked) ? false : true;
        if (this.checked)
            $('form .alert').remove();
    }).prop('checked', false);
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#birthday').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_4"
        }, function (start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });
    });
</script>				

<script type="text/javascript" src="/LeadManagement/resources/js/moment.min2.js"></script>
<script type="text/javascript" src="/LeadManagement/resources/js/datepicker/daterangepicker.js"></script>

<!-- Datatables -->
<script src="/LeadManagement/js/datatables/js/jquery.dataTables.js"></script>
<script src="/LeadManagement/js/datatables/tools/js/dataTables.tableTools.js"></script>

<script>
$(document).ready(function () {
$('input.tableflat').iCheck({
    checkboxClass: 'icheckbox_flat-green',
    radioClass: 'iradio_flat-green'
});
});

var asInitVals = new Array();
$(document).ready(function () {
var oTable = $('#example').dataTable({
    "oLanguage": {
        "sSearch": "Search all columns:"
    },
    "aoColumnDefs": [
        {
            'bSortable': false,
            'aTargets': [0]
        } //disables sorting for column one
    ],
    'iDisplayLength': 12,
    "sPaginationType": "full_numbers",
    "dom": 'T<"clear">lfrtip',
    "tableTools": {
        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
    }
});
$("tfoot input").keyup(function () {
    /* Filter on the column based on the index of this element's parent <th> */
    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
});
$("tfoot input").each(function (i) {
    asInitVals[i] = this.value;
});
$("tfoot input").focus(function () {
    if (this.className == "search_init") {
        this.className = "";
        this.value = "";
    }
});
$("tfoot input").blur(function (i) {
    if (this.value == "") {
        this.className = "search_init";
        this.value = asInitVals[$("tfoot input").index(this)];
    }
});
});
</script>


</body>

</html>