FROM madnificent/ember:2.14.0 as ember

COPY . /app
RUN npm install && bower install
RUN ember build

FROM semtech/mu-nginx-spa-proxy
COPY --from=0 /app/dist /app
