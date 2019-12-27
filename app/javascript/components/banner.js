import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Create your own cocktail recipe"],
    typeSpeed: 99,
    loop: false
  });
}

export { loadDynamicBannerText };
