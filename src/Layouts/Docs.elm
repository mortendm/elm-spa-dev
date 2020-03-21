module Layouts.Docs exposing (view)

import Element exposing (..)
import Element.Font as Font
import Ui exposing (colors)
import Utils.Spa as Spa


view : Spa.LayoutContext msg -> Element msg
view { page } =
    row
        [ width (fill |> maximum 720)
        , centerX
        , paddingEach
            { top = 48
            , left = 16
            , right = 16
            , bottom = 128
            }
        ]
        [ el [ width (px 200), alignTop ] viewSidebar
        , el [ alignTop, width fill ] page
        ]


viewSidebar : Element msg
viewSidebar =
    column
        [ spacing 16 ]
        [ el [ Font.semiBold, Font.size 24 ] (text "docs")
        , el [ Font.color colors.coral ] (viewLink ( "overview", "/docs" ))
        , column [ spacing 16 ]
            [ viewSectionHeader "elm-spa"
            , viewLinks
                [ ( "overview", "/docs/elm-spa/" )
                , ( "elm-spa init", "/docs/elm-spa/init" )
                , ( "elm-spa add", "/docs/elm-spa/add" )
                , ( "elm-spa build", "/docs/elm-spa/build" )
                ]
            , viewSectionHeader "pages"
            , viewLinks
                [ ( "overview", "/docs/pages" )
                , ( "static", "/docs/pages/static" )
                , ( "sandbox", "/docs/pages/sandbox" )
                , ( "element", "/docs/pages/element" )
                , ( "component", "/docs/pages/component" )
                ]
            ]
        ]


viewSectionHeader : String -> Element msg
viewSectionHeader label =
    el [ Font.semiBold, Font.size 20, alpha 0.5 ]
        (text label)


viewLinks : List ( String, String ) -> Element msg
viewLinks links =
    column [ spacing 12, Font.color colors.coral ]
        (List.map viewLink links)


viewLink : ( String, String ) -> Element msg
viewLink ( label, url ) =
    link [ Font.underline, Font.size 16, mouseOver [ alpha 0.5 ] ]
        { url = url, label = text label }
