// script.js
$(document).ready(function() {
    // Initialize tooltips
    $('[data-toggle="tooltip"]').tooltip();

    // Initialize popovers
    $('[data-toggle="popover"]').popover();

    // Initialize AJAX requests
    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            xhr.setRequestHeader("X-CSRFToken", "{{ csrf_token }}");
        }
    });

    // Handle crypto prices AJAX request
    $('#crypto-prices-button').click(function() {
        $.ajax({
            url: '{% url "crypto_prices_ajax" %}',
            method: 'GET',
            success: function(data) {
                $('#crypto-prices-table').html(data);
            }
        });
    });

    // Handle AI trader status AJAX request
    $('#ai-trader-status-button').click(function() {
        $.ajax({
            url: '{% url "ai_trader_status_ajax" %}',
            method: 'GET',
            success: function(data) {
                $('#ai-trader-status').html(data);
            }
        });
    });

    // Handle AI trader start AJAX request
    $('#ai-trader-start-button').click(function() {
        $.ajax({
            url: '{% url "ai_trader_start_ajax" %}',
            method: 'POST',
            success: function(data) {
                $('#ai-trader-status').html(data);
            }
        });
    });

    // Handle AI trader stop AJAX request
    $('#ai-trader-stop-button').click(function() {
        $.ajax({
            url: '{% url "ai_trader_stop_ajax" %}',
            method: 'POST',
            success: function(data) {
                $('#ai-trader-status').html(data);
            }
        });
    });
});
