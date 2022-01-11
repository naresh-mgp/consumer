App.messages = App.cable.subscriptions.create('DatasChannel', {  
    received: function(data) {
      return $('#advertisements').append(this.renderAdvertisement(data));
    },
  
    renderAdvertisement: function(data) {
      return `<ul>
                <li>${data.name}</li>
              </ul>`;
    }
  });