import 'bootstrap';
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';




document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  initUpdateNavbarOnScroll();
  initSelect2();
  loadDynamicBannerText();
});



console.log('Hello World from Webpacker')
