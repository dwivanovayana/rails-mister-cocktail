import 'bootstrap';
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { loadDynamicBannerText } from '../components/banner';



loadDynamicBannerText();
initSelect2();
console.log('Hello World from Webpacker')
