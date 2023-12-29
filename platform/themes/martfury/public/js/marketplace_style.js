 $(document).on('change', '#name', (e) => {
    if (!$('#edit-slug-box').hasClass('hidden')) {
        $('#edit-slug-box').addClass('hidden');
    }
});