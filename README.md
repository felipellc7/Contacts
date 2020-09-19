### Contacts

**You can see the specification of this API by copying the documentation below in** [Swagger Editor](https://editor.swagger.io/)

```
openapi: 3.0.1
info:
  version: 1.0.0
  title: Hackathon Koombea 2019
  description: Esta es la documentacion del API de administración de contactos.
  contact:
    name: Koombea
    email: culture@koombea.com
    url: 'https://www.koombea.com/'
servers:
  - url: '{scheme}://api.hackathon2019.koombea.io/v1'
    variables:
      scheme:
        enum:
          - https
          - http
        default: https
security:
  - ApiKeyAuth: []
paths:
  /users/sign_up:
    post:
      tags:
        - Registro
      summary: Registro de usuarios
      description: >-
        En caso de éxito se debe retornar un JSON con los datos del usuario
        creado, en caso contrario, una lista de errores
      operationId: usersSignUp
      requestBody:
        description: Datos del usuario a registrar
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                user:
                  $ref: '#/components/schemas/NewUser'
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/User'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
        '422':
          description: Error de validación
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorApiResponse'
      security: []
  /users/sign_in:
    post:
      tags:
        - Sesion
      summary: Autenticación de usuarios
      description: >-
        En caso de éxito se debe retornar un JSON con los datos del usuario
        autenticado y su token de sesión, en caso contrario, una lista de
        errores
      operationId: usersSignIn
      requestBody:
        description: Credenciales del usuario a autenticar
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                user:
                  $ref: '#/components/schemas/UserCredentials'
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/AuthenticatedUser'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
        '422':
          description: Error de validación
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorApiResponse'
      security: []
  /users/sign_out:
    get:
      tags:
        - Sesion
      summary: Cerrar sesion de usuario
      description: >-
        En caso de éxito se debe retornar un JSON vacío, en caso contrario, una lista de
        errores
      operationId: usersSignOut
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema: {}
              example: '{}'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
  /profile:
    get:
      tags:
        - Perfil de usuario
      summary: 'Obtiene los datos de usuario de la sesión actual'
      description: >-
        En caso de éxito se debe retornar un JSON con los datos del usuario autenticado, en caso contrario, una lista de
        errores
      operationId: profileRead
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UserProfile'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
    put:
      tags:
        - Perfil de usuario
      summary: 'Actualiza los datos de usuario de la sesión actual'
      description: >-
        En caso de éxito se debe retornar un JSON con los datos del usuario autenticado, en caso contrario, una lista de
        errores
      operationId: profileUpdate
      requestBody:
        description: Datos del usuario a actualizar
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                user:
                  $ref: '#/components/schemas/PersonParams'
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UserProfile'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
        '422':
          description: Error de validación
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorApiResponse'
  /profile/photo:
    put:
      tags:
        - Perfil de usuario
      summary: 'Actualiza la foto de perfil al usuario de la sesión actual'
      description: >-
        En caso de éxito se debe retornar un JSON vacío, en caso contrario, una lista de
        errores
      operationId: profilePhotoUpdate
      requestBody:
        description: Foto del usuario a actualizar
        required: true
        content:
          multipart/form-data:
            schema:
              type: object
              properties:
                photo:
                  type: string
                  format: binary
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema: {}
              example: '{}'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
        '422':
          description: Error de validación
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorApiResponse'
  /contacts:
    get:
      tags:
        - Contactos
      summary: 'Listar contactos'
      description: >-
        En caso de éxito se debe retornar un JSON con la lista de contactos del usuario autenticado, en caso contrario, una lista de
        errores
      operationId: contactsRead
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Contacts'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
    post:
      tags:
        - Contactos
      summary: 'Agregar contactos'
      description: >-
        En caso de éxito se debe retornar un JSON con los datos del contacto creado, en caso contrario, una lista de
        errores
      operationId: contactsCreate
      requestBody:
        description: Datos del contacto a agregar
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                contact:
                  $ref: '#/components/schemas/ContactParams'
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Contact'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
        '422':
          description: Error de validación
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorApiResponse'
  /contacts/{contact-id}:
    get:
      tags:
        - Contactos
      summary: 'Consultar datos de un contacto'
      description: >-
        En caso de éxito se debe retornar un JSON con los datos del contacto, si existe y hace parte de los contactos del usuario autenticado, en caso contrario, una lista de
        errores
      operationId: contactRead
      parameters:
        - in: path
          name: contact-id
          schema:
            type: integer
          required: true
          description: ID numérico del contacto a consultar
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Contact'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
    put:
      tags:
        - Contactos
      summary: 'Actualizar datos de un contacto'
      description: >-
        En caso de éxito se debe retornar un JSON con los datos del contacto, si hace parte de los contactos del usuario autenticado, en caso contrario, una lista de
        errores
      operationId: contactUpdate
      parameters:
        - in: path
          name: contact-id
          schema:
            type: integer
          required: true
          description: ID numérico del contacto a actualizar
      requestBody:
        description: Datos del contacto a actualizar
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                contact:
                  $ref: '#/components/schemas/ContactParams'
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Contact'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
        '422':
          description: Error de validación
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorApiResponse'
    delete:
      tags:
        - Contactos
      summary: 'Eliminar un contacto'
      description: >-
        En caso de éxito se debe retornar un JSON vacío, si hace parte de los contactos del usuario autenticado, en caso contrario, una lista de
        errores
      operationId: contactDestroy
      parameters:
        - in: path
          name: contact-id
          schema:
            type: integer
          required: true
          description: ID numérico del contacto a eliminar
      responses:
        '200':
          description: Operación exitosa
          content:
            application/json:
              schema: {}
              example: '{}'
        '401':
          description: No autorizado
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/UnauthorizedApiResponse'
        '422':
          description: Error de validación
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/ErrorApiResponse'
              example:
                status: 422
                errors:
                  - detail: "El contacto no pertenece a tu cuenta"
components:
  schemas:
    PersonParams:
      type: object
      properties:
        name:
          type: string
          example: Roger Martinez
        email:
          type: string
          example: roger.martinez@seleccioncolombia.com.co
        address:
          type: string
          example: 'Calle 85, 53 - 14'
        phone:
          type: string
          example: 3012528558
    ContactParams:
      allOf:
        - $ref: '#/components/schemas/PersonParams'
      type: object
      properties:
        social_networks:
          type: array
          items:
            $ref: '#/components/schemas/SocialNetwork'
    User:
      allOf:
        - $ref: '#/components/schemas/PersonParams'
      type: object
      properties:
        id:
          type: integer
          example: 37
        photo_url:
          type: string
          example: null
    UserProfile:
      allOf:
        - $ref: '#/components/schemas/User'
      type: object
      properties:
        photo_url:
          type: string
          example: 'https://s3.amazonaws.com/lmxwebsite/media/wpagephotos/69/2/132520/132520.jpg'
    Contact:
      allOf:
        - $ref: '#/components/schemas/PersonParams'
      type: object
      properties:
        id:
          type: integer
          example: 86
        social_networks:
          type: array
          items:
            $ref: '#/components/schemas/SocialNetwork'
    Contacts:
      type: array
      items:
        $ref: '#/components/schemas/Contact'
      example:
        - id: 86
          name: Duvan Zapata
          email: duvan.zapata@seleccioncolombia.com.co
          address: 'Calle 53, 85 - 14'
          phone: 4525456789
          social_networks:
            - type: Facebook
              url: 'https://www.facebook.com/duvan.zapata'
            - type: WhatsApp
              number: '+394525456789'
            - type: Youtube
              url: 'https://www.youtube.com/user/duzan.zapata'
        - id: 37
          name: Roger Martinez
          email: roger.martinez@seleccioncolombia.com.co
          address: 'Calle 85, 53 - 14'
          phone: 3012528558
          social_networks:
            - type: Youtube
              url: 'https://www.youtube.com/user/roger.martinez'
            - type: Twitter
              url: 'https://twitter.com/rogermartinez'
            - type: Instagram
              url: 'https://www.instagram.com/rogermartinez/'
            - type: Reddit
              url: 'https://www.reddit.com/user/rogermartinez/'
            - type: Facebook
              url: 'https://www.facebook.com/roger.martinez'
            - type: WhatsApp
              number: '+573012528558'
    NewUser:
      allOf:
        - $ref: '#/components/schemas/PersonParams'
      type: object
      properties:
        password:
          type: string
        password_confirmation:
          type: string
    UserCredentials:
      type: object
      properties:
        email:
          type: string
          example: roger.martinez@seleccioncolombia.com.co
        password:
          type: string
          example: '***********'
    AuthenticatedUser:
      allOf:
        - $ref: '#/components/schemas/User'
      type: object
      properties:
        api_key:
          type: string
          example: kdjgKDGKJDGkdjgdkdjghKJd873gdikug=
    SocialNetwork:
      type: object
      properties:
        type:
          type: string
          example: Facebook
        url:
          type: string
          example: https://www.facebook.com/user.name
        number:
          type: string
          example: '+1898526354'
    UnauthorizedApiResponse:
      type: object
      properties:
        status:
          type: integer
          format: int32
          example: 401
        errors:
          type: array
          items:
            type: object
            properties:
              detail:
                type: string
                example: No autorizado
    ErrorApiResponse:
      type: object
      properties:
        status:
          type: integer
          format: int32
          example: 422
        errors:
          type: array
          items:
            type: object
            properties:
              detail:
                type: string
                example: El formato del email no es correcto
  securitySchemes:
    ApiKeyAuth:
      type: apiKey
      name: X-API-Key
      in: header
```