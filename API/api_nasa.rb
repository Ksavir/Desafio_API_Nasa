# Dependencias necesarias para trabajar con la API de la NASA
require "uri"
require "net/http"
require 'json'

def ApiNasa(url)
    # Parseamos la url para poder trabajarla y sus certificados de seguridad
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    #Creamos el request con los metodos y protocolos correspondientes
    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'

    # Guardamos la respuesta del request
    response = http.request(request)

    # Retornamos la respuesta pero parseada a JSON ara poder trabajarlo
    return JSON.parse(response.body)
end

def build_web_page(data)
    
    data_photos = data["photos"][0..9]
    # Mapeamos los datos y se guarda el valor de hash "img_src"
    photos = data_photos.map{|i| i["img_src"]}

    html_body = "<html>\n<head>\n</head>\n<body>\n<ul>\n"
    html_body += "#{photos.map { |photo| "\t<li><img src=\"#{photo}\"></li>\n" }.join}"
    html_body += "</ul> \n</body>\n</html>"

    puts html_body

    File.write('index.html', html_body)

end

# Crear un método photos_count que reciba el hash de respuesta y devuelva un nuevo
# hash con el nombre de la cámara y la cantidad de fotos. 
def photos_count(data)
    
    # Guardamos la información
    camera_photos_data = data["photos"]
    camera_photos = {}

    # Pasamos por un each para conseguir el nombre de la camara
    camera_photos_data.each do |camera_data|
        camera_name = camera_data["camera"]["name"]
    # pasamos a int el resultado ya que el primer resultado sería nill y le vamos sumando de a uno por ocurrencia
        camera_photos[camera_name] = camera_photos[camera_name].to_i + 1
    end 

    puts camera_photos

end

#clave de la api de la nasa, generada a traves de la pagina web de la nasa
apikey = "GculItxj35yrD8yY0vJriNV8FVfWWIsw3OTYcoec"

# Invocamos el método ApiNasa para poder trabajar con los datos
data = ApiNasa("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&api_key=#{apikey}")

build_web_page(data)
photos_count(data)