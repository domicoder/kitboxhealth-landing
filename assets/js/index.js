import { scrollToElementById } from './utils/document.js';

// [*start] global js
document.addEventListener('DOMContentLoaded', () => {
    const btnGetStarted = document.getElementById('btn-get-started');
    btnGetStarted.addEventListener('click', () => {
        window.open(
            'https://kitboxhealth-app.vercel.app/get-appointment/',
            '_blank'
        );
    });

    const btnServices = document.getElementById('btn-services');
    btnServices.addEventListener('click', () => {
        window.open(
            'https://kitboxhealth-app.vercel.app/find-doctors/',
            '_blank'
        );
    });

    const btnMoreAbout = document.getElementById('btn-more-about');
    btnMoreAbout.addEventListener('click', () =>
        scrollToElementById('content-section')
    );

    const btnOurServices = document.getElementById('btn-our-services');
    btnOurServices.addEventListener('click', () =>
        window.open('https://kitboxhealth-app.vercel.app/', '_blank')
    );
});
// [*end] global js
