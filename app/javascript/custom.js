document.addEventListener('DOMContentLoaded', function () {
    console.log('Custom JavaScript is loaded and running.');

    // Select the toggler button
    const toggler = document.querySelector('.navbar-toggler');
    
    if (toggler) {
        toggler.addEventListener('click', function () {
            // Toggle a class on the header when the off-canvas is opened or closed
            const header = document.querySelector('.header-container');
            if (header) {
                header.classList.toggle('offcanvas-open');
                console.log('Offcanvas toggled');
            }
        });

        // Close the off-canvas when clicking outside of it
        document.addEventListener('click', function (event) {
            const offcanvas = document.querySelector('#offcanvasNavbar');
            if (offcanvas && offcanvas.classList.contains('show') && !offcanvas.contains(event.target) && !toggler.contains(event.target)) {
                toggler.click(); 
                console.log('Clicked off');
            }
        });
    }

    // Modal for confirming user wants to delete an order
    const deleteModal = document.getElementById('deleteModal');
    console.log('JavaScript for deleteModal is loaded and running.', deleteModal);
    if (deleteModal) {
        deleteModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget;
            const orderId = button.getAttribute('data-bs-order-id');
            const customerName = button.getAttribute('data-bs-order-customer-name');
            const productCount = button.getAttribute('data-bs-order-product-count');
            const productName = button.getAttribute('data-bs-order-product-name');

            const modalBodyText = deleteModal.querySelector('#modal-body-text');
            const deleteButton = deleteModal.querySelector('.delete-confirm-button');
            console.log('Button pressed')

            if (modalBodyText && deleteButton) {
                modalBodyText.querySelector('#customerName').textContent = customerName;
                modalBodyText.querySelector('#productCount').textContent = productCount;
                modalBodyText.querySelector('#productName').textContent = productName;

                const deleteUrl = `/orders/${orderId}`;
                deleteButton.setAttribute('href', deleteUrl);

                console.log('Order ID:', orderId);
                console.log('Customer Name:', customerName);
                console.log('Product Count:', productCount);
                console.log('Product Name:', productName);
                console.log('Delete URL:', deleteUrl);
            } else {
                console.error('Modal body text or delete button not found');
            }
        });

        const header = document.querySelector('.header-container');
        deleteModal.addEventListener('show.bs.modal', function () {
            if (header) {
                header.classList.add('header-faded');
                console.log('Header faded');
            }
        });

        deleteModal.addEventListener('hide.bs.modal', function () {
            if (header) {
                header.classList.remove('header-faded');
                console.log('Header unfaded');
            }
        });
    }

    // Modal for confirming the deletion of a customer
    const deleteCustomerModal = document.getElementById('deleteCustomerModal');
    console.log('JavaScript for deleteCustomerModal is loaded and running.', deleteCustomerModal);
    if (deleteCustomerModal) {
        deleteCustomerModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget;
            const customerId = button.getAttribute('data-bs-customer-id');
            const customerName = button.getAttribute('data-bs-customer-name');

            const modalBodyText = deleteCustomerModal.querySelector('#modal-body-text');
            const deleteButton = deleteCustomerModal.querySelector('.delete-confirm-button');
        console.log('Button pressed');

            if (modalBodyText && deleteButton) {
                modalBodyText.querySelector('#customerName').textContent = customerName;

                const deleteUrl = `/customers/${customerId}`;
                deleteButton.setAttribute('href', deleteUrl);

                console.log('Customer ID:', customerId);
                console.log('Customer Name:', customerName);
                console.log('Delete URL:', deleteUrl);
            } else {
                console.error('Modal body text or delete button not found');
            }
        });

        const header = document.querySelector('.header-container');
        deleteCustomerModal.addEventListener('show.bs.modal', function () {
            if (header) {
                header.classList.add('header-faded');
            }
        });

        deleteCustomerModal.addEventListener('hide.bs.modal', function () {
            if (header) {
                header.classList.remove('header-faded');
            }
        });
    }

    //Modal for confirming the deletion of an order (custdeleteModal)
 const custdeleteModal = document.getElementById('custdeleteModal');
 console.log('JavaScript for custdeleteModal is loaded and running.', custdeleteModal);
 console.log(custdeleteModal)
 console.log('delete modal custom:', custdeleteModal)
     custdeleteModal.addEventListener('show.bs.modal', function (event) {
         const button = event.relatedTarget;
         const orderId = button.getAttribute('data-bs-order-id');
         const customerName = button.getAttribute('data-bs-order-customer-name');
         const productCount = button.getAttribute('data-bs-order-product-count');
         const productName = button.getAttribute('data-bs-order-product-name');
         
     const modalBodyText = custdeleteModal.querySelector('#modal-body-text');
     const customerNameSpan = modalBodyText.querySelector('#order-customer-name');
     const productCountSpan = modalBodyText.querySelector('#order-product-count');
     const productNameSpan = modalBodyText.querySelector('#order-product-name');
     const deleteButton = custdeleteModal.querySelector('.delete-confirm-button');
     
     if (customerNameSpan && productCountSpan && productNameSpan && deleteButton) {
         customerNameSpan.textContent = customerName;
         productCountSpan.textContent = productCount;
         productNameSpan.textContent = productName;
             
             // Set the href for the delete button
             const deleteUrl = `/orders/${orderId}`;
             deleteButton.setAttribute('href', deleteUrl);
             
             console.log('Order ID:', orderId);
             console.log('Customer Name:', customerName);
             console.log('Product Count:', productCount);
             console.log('Product Name:', productName);
             console.log('Delete URL:', deleteUrl);
         } else {
             console.error('Modal elements not found');
         }
     });

   
    
});

 

