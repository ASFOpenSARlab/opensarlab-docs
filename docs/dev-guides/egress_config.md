# Egress Configuration

If enabled, the Istio service mesh can apply rules for rate limiting and domain blocking. These rules for a particular configuration will only apply to the user or dask pod assigned to the corresponsing egress profile. Thbe configurations need to be found in the root/egress_configs directory. 

## Schema

In general, any parameter starting with `@` is global, `%` is sequential, and `+` is one-time.

Wildcards `*` not allowed.

Comment lines start with `#` and are ignored.

Other line entries:

| Parameter | Value Type | description |
| --- | --- | ----------- |
| `@profile` | str | Required. Egress profile name that will be assigned to the lab profile. There can only be one `@profile` per egress config file. Other `@profile` references will be ignored. Because the profile name is part of the naming structure of some k8s resources, it must be fqdn compatible. |
| `@rate` | int | Required. Rate limit (per 10 seconds) applied to the assigned pod. Value is the max value of requests per second. Any subsequent `@rate` is ignored. To turn off rate limit, set value to `None`.|
| `@list` | `white` or `black` | Required. Either the config is a whitelist or a blacklist. Any subsequent `@list` is ignored. |
| `@include` | str | Optional. Any named `.conf` file within a sibling `includes` folder will be copied/inserted at the point of the `@include`. Having `@rate`, `@include`, or `@profile` within the "included" configs will throw and error. Other rules for ordering still apply. |
| `%port` | int,int | Required. Port value for the host. Must have a value between 1 and 65535. Ports can be consolidated by comma seperation. Ports seperated by `=>` will be treated like a redirect (_this is currently not working. The ports will be treated as seperated by a comma_). |
|`%timeout` | str | Optional. Timeout for a valid timeout for any subsequent host. The vlaue must end in `s` for seconds, `m` for minutes, etc. |
|`+ip` | num | Optional. Any valid fqdn ip address.|
|`^`| str | Optional. Globally negate the hostname value. Useful for disabling included hosts. |
|||

Lines not prepended with `@`, `%`, `+`, `^`, or `#` will be treated as a hostname.

## Examples

**Blacklist with rate limiting**

``` conf
# This conf is required!!
# This will be used by profiles that don't have any explicit whitelist and are not None
@profile default
@rate 30
@list black

@include blacklist

# Note that the explicit redirect is not working properly and should not be used
# Both port 80 and port 443 will be allowed, though
%port 80=>443

%timeout 1s
blackhole.webpagetest.org
```

**Whitelist with rate limiting**

```conf
@profile m6a-large-whitelist
@rate 30
@list white

@include asf
@include aws
@include earthdata
@include github
@include local
@include mappings
@include mintpy
@include others
@include packaging
@include ubuntu
```
