const showWeather = () => {
  const weather = document.querySelector("#weather-api")
  if (weather) { 
    fetch('http://api.openweathermap.org/data/2.5/weather?q=tokyo&appid=61aa4137c2a624fd51f9b0b5c814c3ac')
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      })
    }
}

export {showWeather};