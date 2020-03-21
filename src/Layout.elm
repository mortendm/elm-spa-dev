module Layout exposing (view)

import Element exposing (..)
import Element.Font as Font
import Generated.Routes as Routes exposing (Route, routes)
import Utils.Spa as Spa


view : Spa.LayoutContext msg -> Element msg
view { page, route } =
    column
        [ height fill
        , width fill
        , Font.family
            [ Font.external
                { url = "https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600"
                , name = "Source Sans Pro"
                }
            , Font.serif
            ]
        ]
        [ viewHeader route
        , page
        ]


viewHeader : Route -> Element msg
viewHeader currentRoute =
    row
        [ spacing 16
        , paddingEach { top = 32, left = 16, right = 16, bottom = 0 }
        , centerX
        , width (fill |> maximum 720)
        ]
        [ viewLink currentRoute ( "elm-spa", routes.docs_top )
        , el [ Font.size 16 ] (viewLink currentRoute ( "docs", routes.docs_top ))
        , el [ Font.size 16 ] (viewLink currentRoute ( "guide", routes.guide ))
        ]


viewLink : Route -> ( String, Route ) -> Element msg
viewLink currentRoute ( label, route ) =
    if currentRoute == route then
        el
            [ Font.underline
            , Font.color (rgb255 204 75 75)
            , alpha 0.5
            ]
            (text label)

    else
        link
            [ Font.underline
            , Font.color (rgb255 204 75 75)
            , mouseOver [ alpha 0.5 ]
            ]
            { label = text label
            , url = Routes.toPath route
            }
