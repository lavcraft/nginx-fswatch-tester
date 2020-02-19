function dump(r) {
  r.log(njs.dump(r));
}

function encode_query(r) {
  return encodeURI(
    Object.keys(r.args)
      .map(e => e+"="+r.args[e])
      .join("&")
  )
}
