package com.mcleodgaming.ssf2.util
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2.engine.StageData;
    import __AS3__.vec.Vector;
    import flash.geom.Point;
    import com.mcleodgaming.ssf2.Main;
    import com.mcleodgaming.ssf2.controllers.GameController;
    import flash.geom.Rectangle;
    import flash.geom.ColorTransform;
    import com.mcleodgaming.ssf2.engine.*;
    import __AS3__.vec.*;

    public class Vcam 
    {

        public static const NORMAL_MODE:int = 0;
        public static const ZOOM_MODE:int = 1;
        public static const STAGE_MODE:int = 2;

        private var ROOT:MovieClip;
        private var STAGE:MovieClip;
        private var STAGEPARENT:MovieClip;
        private var STAGEDATA:StageData;
        private var HUD:MovieClip;
        private var m_xbounds:Array;
        private var m_ybounds:Array;
        private var m_xtarget:Number;
        private var m_ytarget:Number;
        private var m_xspeed:Number;
        private var m_yspeed:Number;
        private var m_camEaseFactor:Number;
        private var m_camZoomFactor:Number;
        private var m_minZoomHeight:Number;
        private var m_panSpeedCap:Number;
        private var m_zoomSpeedCap:Number;
        private var m_horizontalPanLock:Vector.<Boolean>;
        private var m_verticalPanLock:Vector.<Boolean>;
        private var m_zoomSpeed:Number;
        private var m_mainTerrain:MovieClip;
        private var m_targets:Vector.<MovieClip>;
        private var m_timedTargets:Vector.<MovieClip>;
        private var m_forcedTargets:Vector.<MovieClip>;
        private var m_timedTargetTimers:Vector.<int>;
        private var m_timedTargetPoints:Vector.<Point>;
        private var m_timedTargetPointTimers:Vector.<int>;
        private var m_cam:MovieClip;
        private var m_backgrounds:Vector.<MovieClip>;
        private var m_backgroundsScrollX:Vector.<MovieClip>;
        private var m_backgroundsScrollY:Vector.<MovieClip>;
        private var m_xPanMultiplier:Vector.<Number>;
        private var m_yPanMultiplier:Vector.<Number>;
        private var m_background_canScrollX:Vector.<int>;
        private var m_background_canScrollY:Vector.<int>;
        private var m_background_centX:Vector.<Number>;
        private var m_background_centY:Vector.<Number>;
        private var m_bg_holder:MovieClip;
        private var m_syncedObjects:Vector.<MovieClip>;
        private var m_syncedObjects_positions:Object;
        private var m_syncedObjects_sizes:Object;
        private var m_shakeSpeed:Number;
        private var m_x_shakeSpeed:Number;
        private var m_y_shakeSpeed:Number;
        private var m_originalWidth:Number;
        private var m_originalHeight:Number;
        private var m_originalBGWidth:Vector.<Number>;
        private var m_originalBGHeight:Vector.<Number>;
        private var m_focusMCs:Vector.<MovieClip>;
        private var m_focusTimers:Vector.<int>;
        private var m_stageFocus:FrameTimer;
        private var m_mode:int;
        private var m_dead:Boolean;

        public function Vcam(_arg_1:Object, _arg_2:StageData)
        {
            this.STAGEDATA = _arg_2;
            this.ROOT = this.STAGEDATA.RootRef;
            this.STAGE = this.STAGEDATA.StageRef;
            this.STAGEPARENT = this.STAGEDATA.StageParentRef;
            this.HUD = this.STAGEDATA.HudRef;
            var _local_3:MovieClip = Main.getLibraryMC(_arg_1["linkage_id"]);
            this.m_cam = MovieClip(this.STAGEPARENT.addChild(_local_3));
            this.m_cam.x = _arg_1["x_start"];
            this.m_cam.y = _arg_1["y_start"];
            this.m_originalWidth = _arg_1["width_"];
            this.m_originalHeight = _arg_1["height_"];
            this.m_camEaseFactor = _arg_1["camEaseFactor"];
            this.m_camZoomFactor = _arg_1["camZoomFactor"];
            this.m_minZoomHeight = _arg_1["minZoomHeight"];
            this.m_mode = Vcam.NORMAL_MODE;
            if (_arg_1["mode"] == "stage_zoom")
            {
                this.m_mode = Vcam.STAGE_MODE;
            };
            this.m_mainTerrain = this.STAGEDATA.CamBounds;
            this.m_horizontalPanLock = new Vector.<Boolean>();
            this.m_verticalPanLock = new Vector.<Boolean>();
            this.m_panSpeedCap = 50;
            this.m_zoomSpeedCap = 75;
            this.m_backgrounds = new Vector.<MovieClip>();
            this.m_backgroundsScrollX = new Vector.<MovieClip>();
            this.m_backgroundsScrollY = new Vector.<MovieClip>();
            this.m_background_centX = new Vector.<Number>();
            this.m_background_centY = new Vector.<Number>();
            this.m_xPanMultiplier = new Vector.<Number>();
            this.m_yPanMultiplier = new Vector.<Number>();
            this.m_originalBGWidth = new Vector.<Number>();
            this.m_originalBGHeight = new Vector.<Number>();
            this.m_background_canScrollX = new Vector.<int>();
            this.m_background_canScrollY = new Vector.<int>();
            this.m_dead = false;
            var _local_4:String = "bg";
            var _local_5:int = 1;
            if (_arg_1[_local_4] != null)
            {
                while (_arg_1[_local_4] != null)
                {
                    this.m_backgrounds.push(Main.getLibraryMC(_arg_1[_local_4]));
                    GameController.background.addChild(this.m_backgrounds[(this.m_backgrounds.length - 1)]);
                    this.m_horizontalPanLock.push(((_arg_1[("horizontalPanLock_" + _local_4)]) ? true : false));
                    this.m_verticalPanLock.push(((_arg_1[("verticalPanLock_" + _local_4)]) ? true : false));
                    this.m_background_canScrollX.push(((_arg_1[("horizontalScroll_" + _local_4)]) ? this.m_backgroundsScrollX.length : -1));
                    this.m_background_canScrollY.push(((_arg_1[("verticalScroll_" + _local_4)]) ? this.m_backgroundsScrollY.length : -1));
                    this.m_originalBGWidth.push(((_arg_1[("width_override_" + _local_4)]) ? _arg_1[("width_override_" + _local_4)] : this.m_backgrounds[(this.m_backgrounds.length - 1)].width));
                    this.m_originalBGHeight.push(((_arg_1[("height_override_" + _local_4)]) ? _arg_1[("height_override_" + _local_4)] : this.m_backgrounds[(this.m_backgrounds.length - 1)].height));
                    if (_arg_1[("autoPanMultiplier_" + _local_4)] == false)
                    {
                        this.m_xPanMultiplier.push(((_arg_1[("xPanMultiplier_" + _local_4)]) ? _arg_1[("xPanMultiplier_" + _local_4)] : 1));
                        this.m_yPanMultiplier.push(((_arg_1[("yPanMultiplier_" + _local_4)]) ? _arg_1[("yPanMultiplier_" + _local_4)] : 1));
                    }
                    else
                    {
                        this.m_xPanMultiplier.push((((this.m_originalBGWidth[(this.m_originalBGWidth.length - 1)] - Main.Width) / 2) / this.m_originalBGWidth[(this.m_originalBGWidth.length - 1)]));
                        this.m_yPanMultiplier.push((((this.m_originalBGHeight[(this.m_originalBGHeight.length - 1)] - Main.Height) / 2) / this.m_originalBGHeight[(this.m_originalBGHeight.length - 1)]));
                    };
                    this.m_backgrounds[(this.m_backgrounds.length - 1)].x = (Main.Width / 2);
                    this.m_backgrounds[(this.m_backgrounds.length - 1)].y = (Main.Height / 2);
                    this.m_background_centX.push(this.m_backgrounds[(this.m_backgrounds.length - 1)].x);
                    this.m_background_centY.push(this.m_backgrounds[(this.m_backgrounds.length - 1)].y);
                    if (this.m_background_canScrollX[(this.m_background_canScrollX.length - 1)] >= 0)
                    {
                        this.m_backgroundsScrollX.push(Main.getLibraryMC(_arg_1[_local_4]));
                        this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)].x = (this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)].x - this.m_backgrounds[(this.m_backgrounds.length - 1)].width);
                        GameController.background.addChild(this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)]);
                        this.m_backgroundsScrollX.push(Main.getLibraryMC(_arg_1[_local_4]));
                        this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)].x = (this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)].x + this.m_backgrounds[(this.m_backgrounds.length - 1)].width);
                        GameController.background.addChild(this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)]);
                    };
                    if (this.m_background_canScrollY[(this.m_background_canScrollY.length - 1)] >= 0)
                    {
                        this.m_backgroundsScrollY.push(Main.getLibraryMC(_arg_1[_local_4]));
                        this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)].y = (this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)].y - this.m_backgrounds[(this.m_backgrounds.length - 1)].height);
                        GameController.background.addChild(this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)]);
                        this.m_backgroundsScrollY.push(Main.getLibraryMC(_arg_1[_local_4]));
                        this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)].y = (this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)].y + this.m_backgrounds[(this.m_backgrounds.length - 1)].height);
                        GameController.background.addChild(this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)]);
                    };
                    _local_5++;
                    _local_4 = ("bg" + _local_5);
                };
                this.fixBG();
            };
            this.m_cam.width = this.m_originalWidth;
            this.m_cam.height = this.m_originalHeight;
            while (this.m_cam.width > this.m_mainTerrain.width)
            {
                this.m_cam.width = (this.m_cam.width - (Main.Width / Main.Width));
                this.m_cam.height = (this.m_cam.height - (Main.Height / Main.Width));
            };
            while (this.m_cam.height > this.m_mainTerrain.height)
            {
                this.m_cam.width = (this.m_cam.width - (Main.Width / Main.Width));
                this.m_cam.height = (this.m_cam.height - (Main.Height / Main.Width));
            };
            this.m_originalWidth = this.m_cam.width;
            this.m_originalHeight = this.m_cam.height;
            this.m_xbounds = new Array();
            this.m_ybounds = new Array();
            this.m_xtarget = 0;
            this.m_ytarget = 0;
            this.m_xspeed = 0;
            this.m_yspeed = 0;
            this.m_zoomSpeed = 0;
            this.m_shakeSpeed = 0;
            this.m_x_shakeSpeed = 0;
            this.m_y_shakeSpeed = 0;
            this.m_focusMCs = new Vector.<MovieClip>();
            this.m_focusTimers = new Vector.<int>();
            this.m_stageFocus = new FrameTimer(1);
            this.m_stageFocus.finish();
            this.m_targets = new Vector.<MovieClip>();
            this.m_timedTargets = new Vector.<MovieClip>();
            this.m_forcedTargets = new Vector.<MovieClip>();
            this.m_timedTargetTimers = new Vector.<int>();
            this.m_timedTargetPoints = new Vector.<Point>();
            this.m_timedTargetPointTimers = new Vector.<int>();
            this.m_syncedObjects = new Vector.<MovieClip>();
            this.m_syncedObjects_positions = new Object();
            this.m_syncedObjects_sizes = new Object();
            if (this.m_cam == null)
            {
                trace((('Error, no camera found in library with linkage name "' + _arg_1["cam_id"]) + '".'));
            };
        }

        public function get Width():Number
        {
            return (this.m_cam.width);
        }

        public function get Height():Number
        {
            return (this.m_cam.height);
        }

        public function get OriginalWidth():Number
        {
            return (this.m_originalWidth);
        }

        public function get OriginalHeight():Number
        {
            return (this.m_originalHeight);
        }

        public function get X():Number
        {
            return (this.m_cam.x);
        }

        public function get Y():Number
        {
            return (this.m_cam.y);
        }

        public function get CornerX():Number
        {
            return (this.m_cam.x - (this.m_cam.width / 2));
        }

        public function get CornerY():Number
        {
            return (this.m_cam.y - (this.m_cam.height / 2));
        }

        public function set CornerX(_arg_1:Number):void
        {
            this.m_cam.x = (_arg_1 + (this.m_cam.width / 2));
        }

        public function set CornerY(_arg_1:Number):void
        {
            this.m_cam.y = (_arg_1 + (this.m_cam.height / 2));
        }

        public function get MainTerrain():MovieClip
        {
            return (this.m_mainTerrain);
        }

        public function get CamMC():MovieClip
        {
            return (this.m_cam);
        }

        public function get Mode():int
        {
            return (this.m_mode);
        }

        public function get Targets():Vector.<MovieClip>
        {
            return (this.m_targets);
        }

        public function get BGs():Vector.<MovieClip>
        {
            return (this.m_backgrounds);
        }

        public function get CamEaseFactor():Number
        {
            return (this.m_camEaseFactor);
        }

        public function set CamEaseFactor(_arg_1:Number):void
        {
            this.m_camEaseFactor = _arg_1;
        }

        public function die():void
        {
            this.killBGs();
            this.deleteAllTargets();
            if (((!(this.m_cam == null)) && (this.m_cam.parent)))
            {
                this.m_cam.parent.removeChild(this.m_cam);
            };
            this.m_dead = true;
        }

        public function changeBG(_arg_1:Object):void
        {
            var _local_4:int;
            var _local_2:String = "bg";
            var _local_3:int = 1;
            if (_arg_1[_local_2] != null)
            {
                this.killBGs();
                while (_arg_1[_local_2] != null)
                {
                    this.m_backgrounds.push(Main.getLibraryMC(_arg_1[_local_2]));
                    GameController.background.addChild(this.m_backgrounds[(this.m_backgrounds.length - 1)]);
                    this.m_horizontalPanLock.push(((_arg_1[("horizontalPanLock_" + _local_2)]) ? true : false));
                    this.m_verticalPanLock.push(((_arg_1[("verticalPanLock_" + _local_2)]) ? true : false));
                    this.m_background_canScrollX.push(((_arg_1[("horizontalScroll_" + _local_2)]) ? this.m_backgroundsScrollX.length : -1));
                    this.m_background_canScrollY.push(((_arg_1[("verticalScroll_" + _local_2)]) ? this.m_backgroundsScrollY.length : -1));
                    this.m_xPanMultiplier.push(((_arg_1[("xPanMultiplier_" + _local_2)]) ? _arg_1[("xPanMultiplier_" + _local_2)] : 1));
                    this.m_yPanMultiplier.push(((_arg_1[("yPanMultiplier_" + _local_2)]) ? _arg_1[("yPanMultiplier_" + _local_2)] : 1));
                    this.m_originalBGWidth.push(((_arg_1[("width_override_" + _local_2)]) ? _arg_1[("width_override_" + _local_2)] : this.m_backgrounds[(this.m_backgrounds.length - 1)].width));
                    this.m_originalBGHeight.push(((_arg_1[("height_override_" + _local_2)]) ? _arg_1[("height_override_" + _local_2)] : this.m_backgrounds[(this.m_backgrounds.length - 1)].height));
                    this.m_backgrounds[(this.m_backgrounds.length - 1)].x = (Main.Width / 2);
                    this.m_backgrounds[(this.m_backgrounds.length - 1)].y = (Main.Height / 2);
                    this.m_background_centX.push(this.m_backgrounds[(this.m_backgrounds.length - 1)].x);
                    this.m_background_centY.push(this.m_backgrounds[(this.m_backgrounds.length - 1)].y);
                    if (this.m_background_canScrollX[(this.m_background_canScrollX.length - 1)] >= 0)
                    {
                        this.m_backgroundsScrollX.push(Main.getLibraryMC(_arg_1[_local_2]));
                        this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)].x = (this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)].x - this.m_backgrounds[(this.m_backgrounds.length - 1)].width);
                        GameController.background.addChild(this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)]);
                        this.m_backgroundsScrollX.push(Main.getLibraryMC(_arg_1[_local_2]));
                        this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)].x = (this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)].x + this.m_backgrounds[(this.m_backgrounds.length - 1)].width);
                        GameController.background.addChild(this.m_backgroundsScrollX[(this.m_backgroundsScrollX.length - 1)]);
                    };
                    if (this.m_background_canScrollY[(this.m_background_canScrollY.length - 1)] >= 0)
                    {
                        this.m_backgroundsScrollY.push(Main.getLibraryMC(_arg_1[_local_2]));
                        this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)].y = (this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)].y - this.m_backgrounds[(this.m_backgrounds.length - 1)].height);
                        GameController.background.addChild(this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)]);
                        this.m_backgroundsScrollY.push(Main.getLibraryMC(_arg_1[_local_2]));
                        this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)].y = (this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)].y + this.m_backgrounds[(this.m_backgrounds.length - 1)].height);
                        GameController.background.addChild(this.m_backgroundsScrollY[(this.m_backgroundsScrollY.length - 1)]);
                    };
                    _local_3++;
                    _local_2 = ("bg" + _local_3);
                };
                this.fixBG();
                this.camControl();
            };
        }

        public function killBGs():void
        {
            this.pauseBG();
            while (this.m_backgrounds.length > 0)
            {
                if (this.m_backgrounds[0].parent)
                {
                    this.m_backgrounds[0].parent.removeChild(this.m_backgrounds[0]);
                };
                this.m_backgrounds.splice(0, 1);
                this.m_background_centX.splice(0, 1);
                this.m_background_centY.splice(0, 1);
                this.m_xPanMultiplier.splice(0, 1);
                this.m_yPanMultiplier.splice(0, 1);
                this.m_originalBGWidth.splice(0, 1);
                this.m_originalBGHeight.splice(0, 1);
                this.m_horizontalPanLock.splice(0, 1);
                this.m_verticalPanLock.splice(0, 1);
                this.m_background_canScrollX.splice(0, 1);
                this.m_background_canScrollY.splice(0, 1);
            };
        }

        public function set Mode(_arg_1:int):void
        {
            this.m_mode = _arg_1;
            if (this.m_mode < 0)
            {
                this.m_mode = Vcam.STAGE_MODE;
                this.maxZoomOut();
                this.fixBG();
            }
            else
            {
                if (this.m_mode > 2)
                {
                    this.m_mode = Vcam.NORMAL_MODE;
                };
            };
        }

        public function fixBG():void
        {
            var _local_1:int;
            while (_local_1 < this.m_backgrounds.length)
            {
                this.m_backgrounds[_local_1].x = (Main.Width / 2);
                this.m_backgrounds[_local_1].y = (Main.Height / 2);
                this.m_background_centX[_local_1] = this.m_backgrounds[_local_1].x;
                this.m_background_centY[_local_1] = this.m_backgrounds[_local_1].y;
                _local_1++;
            };
        }

        public function camControl():void
        {
            this.m_cam.camControl();
        }

        private function getPositions():void
        {
            var _local_2:*;
            var _local_3:MovieClip;
            var _local_4:Vector.<Point>;
            var _local_5:Rectangle;
            var _local_1:int;
            if (this.m_targets.length > 0)
            {
                this.m_xbounds = new Array();
                this.m_ybounds = new Array();
            };
            for (_local_2 in this.m_targets)
            {
                _local_3 = this.m_targets[_local_2];
                _local_4 = new Vector.<Point>();
                if (!(((this.m_focusMCs.length > 0) && (this.m_focusMCs.indexOf(_local_3) < 0)) || (!(this.m_stageFocus.IsComplete))))
                {
                    if (!(!(_local_3)))
                    {
                        _local_5 = new Rectangle();
                        if (_local_3.camOverride)
                        {
                            _local_5.x = _local_3.camOverride.x;
                            _local_5.y = _local_3.camOverride.y;
                            _local_5.width = _local_3.camOverride.width;
                            _local_5.height = _local_3.camOverride.height;
                            if (_local_3.transform.matrix.a < 0)
                            {
                                _local_5.x = (-(_local_5.x) - _local_3.camOverride.width);
                            };
                        }
                        else
                        {
                            if (_local_3.cam_width)
                            {
                                if (_local_3.transform.matrix.a < 0)
                                {
                                    _local_5.x = (-(_local_3.cam_width) / 2);
                                    _local_5.width = _local_3.cam_width;
                                    if (_local_3.cam_x_offset !== undefined)
                                    {
                                        _local_5.x = (_local_5.x - _local_3.cam_x_offset);
                                    };
                                }
                                else
                                {
                                    _local_5.x = (-(_local_3.cam_width) / 2);
                                    _local_5.width = _local_3.cam_width;
                                    if (_local_3.cam_x_offset !== undefined)
                                    {
                                        _local_5.x = (_local_5.x + _local_3.cam_x_offset);
                                    };
                                };
                            };
                            if (_local_3.cam_height)
                            {
                                _local_5.y = -(_local_3.cam_height);
                                _local_5.height = _local_3.cam_height;
                                if (_local_3.cam_y_offset !== undefined)
                                {
                                    _local_5.y = (_local_5.y + _local_3.cam_y_offset);
                                };
                            };
                        };
                        _local_5.x = (_local_5.x * Utils.fastAbs(_local_3.scaleX));
                        _local_5.y = (_local_5.y * Utils.fastAbs(_local_3.scaleY));
                        _local_5.width = (_local_5.width * Utils.fastAbs(_local_3.scaleX));
                        _local_5.height = (_local_5.height * Utils.fastAbs(_local_3.scaleY));
                        _local_4.push(new Point(_local_5.x, _local_5.y));
                        _local_4.push(new Point((_local_5.x + _local_5.width), _local_5.y));
                        _local_4.push(new Point((_local_5.x + _local_5.width), (_local_5.y + _local_5.height)));
                        _local_4.push(new Point(_local_5.x, (_local_5.y + _local_5.height)));
                        _local_1 = 0;
                        while (_local_1 < _local_4.length)
                        {
                            if (_local_3 != null)
                            {
                                if ((_local_3.x + _local_4[_local_1].x) < this.m_mainTerrain.x)
                                {
                                    this.m_xbounds.push((this.m_mainTerrain.x + this.STAGE.x));
                                }
                                else
                                {
                                    if ((_local_3.x + _local_4[_local_1].x) > (this.m_mainTerrain.x + this.m_mainTerrain.width))
                                    {
                                        this.m_xbounds.push(((this.m_mainTerrain.x + this.m_mainTerrain.width) + this.STAGE.x));
                                    }
                                    else
                                    {
                                        this.m_xbounds.push(((_local_3.x + _local_4[_local_1].x) + this.STAGE.x));
                                    };
                                };
                                if ((_local_3.y + _local_4[_local_1].y) < this.m_mainTerrain.y)
                                {
                                    this.m_ybounds.push((this.m_mainTerrain.y + this.STAGE.y));
                                }
                                else
                                {
                                    if ((_local_3.y + _local_4[_local_1].y) > (this.m_mainTerrain.y + this.m_mainTerrain.height))
                                    {
                                        this.m_ybounds.push(((this.m_mainTerrain.y + this.m_mainTerrain.height) + this.STAGE.y));
                                    }
                                    else
                                    {
                                        this.m_ybounds.push(((_local_3.y + _local_4[_local_1].y) + this.STAGE.y));
                                    };
                                };
                            };
                            _local_1++;
                        };
                    };
                };
            };
            if (this.m_focusMCs.length > 0)
            {
                _local_1 = 0;
                while (_local_1 < this.m_focusTimers.length)
                {
                    this.m_focusTimers[_local_1]--;
                    if (((this.m_focusTimers[_local_1] < 0) || (!(this.m_focusMCs[_local_1].parent))))
                    {
                        this.m_focusMCs.splice(_local_1, 1);
                        this.m_focusTimers.splice(_local_1, 1);
                        _local_1--;
                    };
                    _local_1++;
                };
            };
            _local_1 = 0;
            while (_local_1 < this.m_timedTargets.length)
            {
                this.m_timedTargetTimers[_local_1]--;
                if (this.m_timedTargetTimers[_local_1] <= 0)
                {
                    this.deleteTimedTarget(this.m_timedTargets[_local_1]);
                    _local_1--;
                };
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < this.m_timedTargetPoints.length)
            {
                this.m_timedTargetPointTimers[_local_1]--;
                if (this.m_timedTargetPointTimers[_local_1] <= 0)
                {
                    this.deleteTimedTargetPoint(this.m_timedTargetPoints[_local_1]);
                    _local_1--;
                }
                else
                {
                    if (this.m_timedTargetPoints[_local_1].x < this.m_mainTerrain.x)
                    {
                        this.m_xbounds.push((this.m_mainTerrain.x + this.STAGE.x));
                    }
                    else
                    {
                        if (this.m_timedTargetPoints[_local_1].x > (this.m_mainTerrain.x + this.m_mainTerrain.width))
                        {
                            this.m_xbounds.push(((this.m_mainTerrain.x + this.m_mainTerrain.width) + this.STAGE.x));
                        }
                        else
                        {
                            this.m_xbounds.push((this.m_timedTargetPoints[_local_1].x + this.STAGE.x));
                        };
                    };
                    if (this.m_timedTargetPoints[_local_1].y < this.m_mainTerrain.y)
                    {
                        this.m_ybounds.push((this.m_mainTerrain.y + this.STAGE.y));
                    }
                    else
                    {
                        if (this.m_timedTargetPoints[_local_1].y > (this.m_mainTerrain.y + this.m_mainTerrain.height))
                        {
                            this.m_ybounds.push(((this.m_mainTerrain.y + this.m_mainTerrain.height) + this.STAGE.y));
                        }
                        else
                        {
                            this.m_ybounds.push((this.m_timedTargetPoints[_local_1].y + this.STAGE.y));
                        };
                    };
                };
                _local_1++;
            };
            if ((!(this.m_stageFocus.IsComplete)))
            {
                this.m_stageFocus.tick();
                this.m_xbounds.push((this.m_mainTerrain.x + this.STAGE.x));
                this.m_xbounds.push(((this.m_mainTerrain.x + this.m_mainTerrain.width) + this.STAGE.x));
                this.m_ybounds.push((this.m_mainTerrain.y + this.STAGE.y));
                this.m_ybounds.push(((this.m_mainTerrain.y + this.m_mainTerrain.height) + this.STAGE.y));
            };
            this.m_xbounds.sort(Array.NUMERIC);
            this.m_ybounds.sort(Array.NUMERIC);
        }

        public function targetCenterStage():void
        {
            this.m_xbounds.push((this.m_mainTerrain.x + (this.m_mainTerrain.width / 2)));
            this.m_ybounds.push((this.m_mainTerrain.y + (this.m_mainTerrain.height / 2)));
        }

        public function targetSelf():void
        {
            this.m_xbounds.push(this.m_cam.x);
            this.m_ybounds.push(this.m_cam.y);
        }

        public function setStageFocus(_arg_1:int):void
        {
            this.m_stageFocus.reset();
            this.m_stageFocus.MaxTime = _arg_1;
        }

        public function removeStageFocus():void
        {
            this.m_stageFocus.finish();
        }

        public function addZoomFocus(_arg_1:MovieClip, _arg_2:int):void
        {
            if (((!(_arg_1 == null)) && (this.m_focusMCs.indexOf(_arg_1) < 0)))
            {
                this.m_focusMCs.push(_arg_1);
                this.m_focusTimers.push(_arg_2);
            };
        }

        public function removeZoomFocus(_arg_1:MovieClip):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:int = this.m_focusMCs.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                this.m_focusMCs.splice(_local_2, 1);
                this.m_focusTimers.splice(_local_2, 1);
            };
        }

        public function removeAllZoomFocus():void
        {
            while (this.m_focusMCs.length > 0)
            {
                this.m_focusMCs.splice(0, 1);
                this.m_focusTimers.splice(0, 1);
            };
        }

        public function addTarget(_arg_1:MovieClip):void
        {
            if (((!(_arg_1 == null)) && (this.m_targets.indexOf(_arg_1) < 0)))
            {
                this.m_targets.push(_arg_1);
            };
        }

        public function addTargets(_arg_1:Vector.<MovieClip>):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (((!(_arg_1[_local_2] == null)) && (this.m_targets.indexOf(_arg_1[_local_2]) < 0)))
                {
                    this.m_targets.push(_arg_1[_local_2]);
                };
            };
        }

        public function addTimedTarget(_arg_1:MovieClip, _arg_2:int):void
        {
            var _local_3:int = this.m_timedTargets.indexOf(_arg_1);
            if (_local_3 < 0)
            {
                this.addTarget(_arg_1);
                this.m_timedTargets.push(_arg_1);
                this.m_timedTargetTimers.push(_arg_2);
            }
            else
            {
                this.m_timedTargetTimers[_local_3] = _arg_2;
            };
        }

        public function addTimedTargetPoint(_arg_1:Point, _arg_2:int):void
        {
            var _local_3:int = this.m_timedTargetPoints.indexOf(_arg_1);
            if (_local_3 < 0)
            {
                this.m_timedTargetPoints.push(_arg_1);
                this.m_timedTargetPointTimers.push(_arg_2);
            }
            else
            {
                this.m_timedTargetPointTimers[_local_3] = _arg_2;
            };
        }

        public function addForcedTarget(_arg_1:MovieClip):void
        {
            var _local_2:int = this.m_forcedTargets.indexOf(_arg_1);
            if (_local_2 < 0)
            {
                this.addTarget(_arg_1);
                this.m_forcedTargets.push(_arg_1);
            };
        }

        public function hasTarget(_arg_1:MovieClip):Boolean
        {
            return (this.m_targets.indexOf(_arg_1) >= 0);
        }

        public function hasTargets(_arg_1:Vector.<MovieClip>):Boolean
        {
            var _local_3:*;
            var _local_4:*;
            var _local_2:Boolean;
            for (_local_3 in _arg_1)
            {
                for (_local_4 in this.m_targets)
                {
                    if (((!(this.m_targets[_local_4] == null)) && (this.m_targets[_local_4] == _arg_1[_local_3])))
                    {
                        _local_2 = true;
                    };
                };
                if ((!(_local_2)))
                {
                    return (false);
                };
            };
            return (true);
        }

        public function deleteTarget(_arg_1:MovieClip):void
        {
            if (((!(_arg_1 == null)) && (this.m_targets.indexOf(_arg_1) >= 0)))
            {
                this.m_targets.splice(this.m_targets.indexOf(_arg_1), 1);
            };
        }

        public function deleteTargets(_arg_1:Vector.<MovieClip>):void
        {
            var _local_2:*;
            var _local_3:int;
            for (_local_2 in _arg_1)
            {
                _local_3 = this.m_targets.indexOf(_arg_1[_local_2]);
                if (_local_3 >= 0)
                {
                    this.m_targets.splice(_local_3, 1);
                };
            };
        }

        public function deleteTimedTarget(_arg_1:MovieClip):void
        {
            var _local_2:int = this.m_timedTargets.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                this.deleteTarget(_arg_1);
                this.m_timedTargets.splice(_local_2, 1);
                this.m_timedTargetTimers.splice(_local_2, 1);
            };
        }

        public function deleteForcedTarget(_arg_1:MovieClip):void
        {
            var _local_2:int = this.m_forcedTargets.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                this.deleteTarget(_arg_1);
                this.m_forcedTargets.splice(_local_2, 1);
            };
        }

        public function deleteTimedTargetPoint(_arg_1:Point):void
        {
            var _local_2:int = this.m_timedTargetPoints.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                this.m_timedTargetPoints.splice(_local_2, 1);
                this.m_timedTargetPointTimers.splice(_local_2, 1);
            };
        }

        public function deleteAllTargets():void
        {
            this.m_targets.splice(0, this.m_targets.length);
        }

        public function followTargets():void
        {
            if (((this.m_xbounds.length == 0) || (this.m_xbounds.length == 0)))
            {
            };
            this.m_xtarget = (this.m_xbounds[0] + (Math.sqrt(Math.pow((this.m_xbounds[0] - this.m_xbounds[(this.m_xbounds.length - 1)]), 2)) / 2));
            this.m_ytarget = (this.m_ybounds[0] + (Math.sqrt(Math.pow((this.m_ybounds[0] - this.m_ybounds[(this.m_ybounds.length - 1)]), 2)) / 2));
            this.m_xspeed = ((this.m_xtarget - this.m_cam.x) / this.m_camEaseFactor);
            this.m_yspeed = ((this.m_ytarget - this.m_cam.y) / this.m_camEaseFactor);
            if (((Utils.fastAbs(this.m_xspeed) < 1) && (Utils.fastAbs(this.m_yspeed) < 1)))
            {
                this.m_xspeed = 0;
                this.m_yspeed = 0;
            };
            if (this.m_xspeed != 0)
            {
                this.m_xspeed = ((this.m_xspeed > 0) ? Math.min(this.m_xspeed, this.m_panSpeedCap) : Math.max(this.m_xspeed, -(this.m_panSpeedCap)));
            };
            if (this.m_yspeed != 0)
            {
                this.m_yspeed = ((this.m_yspeed > 0) ? Math.min(this.m_yspeed, this.m_panSpeedCap) : Math.max(this.m_yspeed, -(this.m_panSpeedCap)));
            };
            this.m_cam.x = (this.m_cam.x + this.m_xspeed);
            this.m_cam.y = (this.m_cam.y + this.m_yspeed);
            this.forceInBounds();
            this.syncPositions();
        }

        public function forceTarget():void
        {
            if (((this.m_xbounds.length == 0) || (this.m_xbounds.length == 0)))
            {
            };
            this.m_xtarget = (this.m_xbounds[0] + (Math.sqrt(Math.pow((this.m_xbounds[0] - this.m_xbounds[(this.m_xbounds.length - 1)]), 2)) / 2));
            this.m_ytarget = (this.m_ybounds[0] + (Math.sqrt(Math.pow((this.m_ybounds[0] - this.m_ybounds[(this.m_ybounds.length - 1)]), 2)) / 2));
            this.m_xspeed = 0;
            this.m_yspeed = 0;
            this.m_cam.x = this.m_xtarget;
            this.m_cam.y = this.m_ytarget;
            this.forceInBounds();
            this.syncPositions();
        }

        public function zoom():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            if (((this.m_xbounds.length == 0) || (this.m_xbounds.length == 0)))
            {
            };
            if (this.m_ybounds.length > 0)
            {
                _local_1 = this.m_minZoomHeight;
                _local_2 = (_local_1 * (this.m_originalWidth / this.m_originalHeight));
                _local_3 = (this.m_xbounds[(this.m_xbounds.length - 1)] - this.m_xbounds[0]);
                _local_4 = (this.m_ybounds[(this.m_ybounds.length - 1)] - this.m_ybounds[0]);
                if (_local_3 < _local_2)
                {
                    _local_3 = _local_2;
                };
                if (_local_4 < _local_1)
                {
                    _local_4 = _local_1;
                };
                if ((_local_3 / _local_4) > (this.m_originalWidth / this.m_originalHeight))
                {
                    _local_4 = (_local_3 * (this.m_originalHeight / this.m_originalWidth));
                }
                else
                {
                    _local_3 = (_local_4 * (this.m_originalWidth / this.m_originalHeight));
                };
                _local_2 = ((_local_3 - this.m_cam.width) / this.m_camZoomFactor);
                _local_1 = ((_local_4 - this.m_cam.height) / this.m_camZoomFactor);
                if (_local_2 > this.m_zoomSpeedCap)
                {
                    _local_2 = this.m_zoomSpeedCap;
                    _local_1 = (_local_2 * (this.m_originalHeight / this.m_originalWidth));
                };
                if (_local_1 > this.m_zoomSpeedCap)
                {
                    _local_1 = this.m_zoomSpeedCap;
                    _local_2 = (_local_1 * (this.m_originalWidth / this.m_originalHeight));
                };
                if (((Utils.fastAbs(_local_2) < 1) && (Utils.fastAbs(_local_1) < 1)))
                {
                    _local_2 = 0;
                    _local_1 = 0;
                };
            };
            if ((((this.m_cam.width + _local_2) < this.m_mainTerrain.width) && ((this.m_cam.height + _local_1) < this.m_mainTerrain.height)))
            {
                this.m_cam.width = (this.m_cam.width + _local_2);
                this.m_cam.height = (this.m_cam.height + _local_1);
                this.syncZoom();
                this.syncPositions();
            };
        }

        public function zoomIn():void
        {
            if (this.m_cam.width > (this.m_originalWidth / 10))
            {
                this.m_cam.width = (this.m_cam.width + (-15 * 1));
                this.m_cam.height = (this.m_cam.height + (-15 * 0.5625));
                this.forceInBounds();
                this.syncZoom();
                this.syncPositions();
                this.m_cam.camControl();
            };
        }

        public function zoomOut():void
        {
            if (this.m_cam.height < this.m_mainTerrain.height)
            {
                this.m_cam.width = (this.m_cam.width + (15 * 1));
                this.m_cam.height = (this.m_cam.height + (15 * 0.5625));
                this.forceInBounds();
                this.syncZoom();
                this.syncPositions();
                this.m_cam.camControl();
            };
        }

        public function shake(_arg_1:Number):void
        {
            this.m_shakeSpeed = _arg_1;
            if (this.m_shakeSpeed > 20)
            {
                this.m_shakeSpeed = 20;
            };
        }

        public function darken():void
        {
            var _local_1:MovieClip;
            if (this.STAGEDATA.HudRef.parent.getChildByName("darkener") == null)
            {
                _local_1 = Main.getLibraryMC("darkening");
                _local_1.name = "darkener";
                this.STAGEDATA.HudRef.parent.addChild(_local_1);
                this.STAGEDATA.HudRef.parent.swapChildren(this.STAGEDATA.HudRef, _local_1);
            };
        }

        public function killDarkener():void
        {
            if (this.STAGEDATA.HudRef.parent.getChildByName("darkener") != null)
            {
                MovieClip(this.STAGEDATA.HudRef.parent.getChildByName("darkener")).stop();
                this.STAGEDATA.HudRef.parent.swapChildren(this.STAGEDATA.HudRef, this.STAGEDATA.HudRef.parent.getChildByName("darkener"));
                this.STAGEDATA.HudRef.parent.removeChild(MovieClip(this.STAGEDATA.HudRef.parent.getChildByName("darkener")));
            };
        }

        public function brighten():void
        {
            if (this.STAGEDATA.HudRef.parent.getChildByName("darkener") != null)
            {
                if (MovieClip(this.STAGEDATA.HudRef.parent.getChildByName("darkener")).finished)
                {
                    MovieClip(this.STAGEDATA.HudRef.parent.getChildByName("darkener")).play();
                }
                else
                {
                    MovieClip(this.STAGEDATA.HudRef.parent.getChildByName("darkener")).shouldStop = false;
                };
            };
        }

        public function lightFlash(_arg_1:Boolean=true):void
        {
            var _local_2:MovieClip = this.STAGEDATA.attachUniqueMovieHUD(((_arg_1) ? "flashOfLight" : "flashOfLightQuick"));
        }

        private function effects():void
        {
            var _local_1:Number;
            var _local_2:Number;
            if (this.m_shakeSpeed > 0)
            {
                _local_1 = Math.round(((Utils.random() * (this.m_shakeSpeed * 2)) - this.m_shakeSpeed));
                _local_2 = Math.round(((Utils.random() * (this.m_shakeSpeed * 2)) - this.m_shakeSpeed));
                this.m_cam.x = (this.m_cam.x + _local_1);
                this.m_cam.y = (this.m_cam.y + _local_2);
                this.syncPositions();
                this.m_shakeSpeed--;
            };
        }

        public function syncObjects(_arg_1:Vector.<MovieClip>):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (_arg_1[_local_2] != null)
                {
                    this.m_syncedObjects.push(_arg_1[_local_2]);
                    this.m_syncedObjects_positions[_arg_1[_local_2].name] = new Array((_arg_1[_local_2].x / Main.Root.width), (_arg_1[_local_2].y / Main.Root.height));
                    this.m_syncedObjects_sizes[_arg_1[_local_2].name] = new Array(_arg_1[_local_2].width, _arg_1[_local_2].height);
                };
            };
        }

        public function forceInBounds():void
        {
            if ((!(this.m_stageFocus.IsComplete)))
            {
                return;
            };
            var _local_1:Number = (Main.Width / Main.Height);
            if (this.m_cam.height > this.m_mainTerrain.height)
            {
                this.m_cam.height = this.m_mainTerrain.height;
                this.m_cam.width = (this.m_mainTerrain.height * _local_1);
            };
            if (this.m_cam.width > this.m_mainTerrain.width)
            {
                this.m_cam.width = this.m_mainTerrain.width;
                this.m_cam.height = (this.m_mainTerrain.width * (1 / _local_1));
            };
            if (this.CornerX < (this.m_mainTerrain.x + this.STAGE.x))
            {
                this.CornerX = (this.m_mainTerrain.x + this.STAGE.x);
            };
            if ((this.CornerX + this.m_cam.width) > ((this.m_mainTerrain.x + this.m_mainTerrain.width) + this.STAGE.x))
            {
                this.CornerX = (((this.m_mainTerrain.x + this.m_mainTerrain.width) - this.m_cam.width) + this.STAGE.x);
            };
            if (this.CornerY < (this.m_mainTerrain.y + this.STAGE.y))
            {
                this.CornerY = (this.m_mainTerrain.y + this.STAGE.y);
            };
            if ((this.CornerY + this.m_cam.height) > ((this.m_mainTerrain.y + this.m_mainTerrain.height) + this.STAGE.y))
            {
                this.CornerY = (((this.m_mainTerrain.y + this.m_mainTerrain.height) - this.m_cam.height) + this.STAGE.y);
            };
        }

        public function syncPositions():void
        {
            var _local_1:int;
            var _local_2:int;
            while (_local_2 < this.m_backgrounds.length)
            {
                if (((!(this.m_xPanMultiplier[_local_2] == 0)) && (!(this.m_horizontalPanLock[_local_2]))))
                {
                    if (this.m_background_canScrollX[_local_2] < 0)
                    {
                        this.m_backgrounds[_local_2].x = this.m_background_centX[_local_2];
                        _local_1 = ((this.m_xPanMultiplier[_local_2] < 0) ? -1 : 1);
                        this.m_backgrounds[_local_2].x = (this.m_backgrounds[_local_2].x + ((_local_1 * (((this.m_mainTerrain.x + this.STAGE.x) + (this.m_mainTerrain.width / 2)) - this.m_cam.x)) * Utils.fastAbs(this.m_xPanMultiplier[_local_2])));
                    }
                    else
                    {
                        this.m_backgrounds[_local_2].x = this.m_background_centX[_local_2];
                        _local_1 = ((this.m_xPanMultiplier[_local_2] < 0) ? -1 : 1);
                        this.m_backgrounds[_local_2].x = (this.m_backgrounds[_local_2].x + (((_local_1 * (((this.m_mainTerrain.x + this.STAGE.x) + (this.m_mainTerrain.width / 2)) - this.m_cam.x)) * Utils.fastAbs(this.m_xPanMultiplier[_local_2])) % this.m_backgrounds[_local_2].width));
                        this.m_backgroundsScrollX[this.m_background_canScrollX[_local_2]].x = (this.m_backgrounds[_local_2].x - this.m_originalBGWidth[_local_2]);
                        this.m_backgroundsScrollX[(this.m_background_canScrollX[_local_2] + 1)].x = (this.m_backgrounds[_local_2].x + this.m_originalBGWidth[_local_2]);
                    };
                };
                if (((!(this.m_yPanMultiplier[_local_2] == 0)) && (!(this.m_verticalPanLock[_local_2]))))
                {
                    if (this.m_background_canScrollY[_local_2] < 0)
                    {
                        this.m_backgrounds[_local_2].y = this.m_background_centY[_local_2];
                        _local_1 = ((this.m_yPanMultiplier[_local_2] < 0) ? -1 : 1);
                        this.m_backgrounds[_local_2].y = (this.m_backgrounds[_local_2].y + ((_local_1 * (((this.m_mainTerrain.y + this.STAGE.y) + (this.m_mainTerrain.height / 2)) - this.m_cam.y)) * Utils.fastAbs(this.m_yPanMultiplier[_local_2])));
                    }
                    else
                    {
                        this.m_backgrounds[_local_2].y = this.m_background_centY[_local_2];
                        _local_1 = ((this.m_yPanMultiplier[_local_2] < 0) ? -1 : 1);
                        this.m_backgrounds[_local_2].y = (this.m_backgrounds[_local_2].y + (((_local_1 * (((this.m_mainTerrain.y + this.STAGE.y) + (this.m_mainTerrain.height / 2)) - this.m_cam.y)) * Utils.fastAbs(this.m_yPanMultiplier[_local_2])) % this.m_backgrounds[_local_2].height));
                        this.m_backgroundsScrollY[this.m_background_canScrollY[_local_2]].y = (this.m_backgrounds[_local_2].y - this.m_originalBGHeight[_local_2]);
                        this.m_backgroundsScrollY[(this.m_background_canScrollY[_local_2] + 1)].y = (this.m_backgrounds[_local_2].y + this.m_originalBGHeight[_local_2]);
                    };
                };
                if (this.m_background_canScrollX[_local_2] >= 0)
                {
                    this.m_backgroundsScrollX[this.m_background_canScrollX[_local_2]].y = this.m_backgrounds[_local_2].y;
                    this.m_backgroundsScrollX[(this.m_background_canScrollX[_local_2] + 1)].y = this.m_backgrounds[_local_2].y;
                };
                if (this.m_background_canScrollY[_local_2] >= 0)
                {
                    this.m_backgroundsScrollY[this.m_background_canScrollY[_local_2]].x = this.m_backgrounds[_local_2].x;
                    this.m_backgroundsScrollY[(this.m_background_canScrollY[_local_2] + 1)].x = this.m_backgrounds[_local_2].x;
                };
                _local_2++;
            };
        }

        private function syncZoom():void
        {
            var _local_1:*;
            for (_local_1 in this.m_syncedObjects)
            {
                this.m_syncedObjects[_local_1].width = (this.m_syncedObjects_sizes[this.m_syncedObjects[_local_1]][0] * (this.m_cam.width / this.m_originalWidth));
                this.m_syncedObjects[_local_1].height = (this.m_syncedObjects_sizes[this.m_syncedObjects[_local_1]][1] * (this.m_cam.height / this.m_originalHeight));
            };
        }

        public function panLeft():void
        {
            if (this.CornerX > (this.m_mainTerrain.x + this.STAGE.x))
            {
                this.m_cam.x = (this.m_cam.x - 15);
                this.syncPositions();
                this.m_cam.camControl();
            };
        }

        public function panRight():void
        {
            if ((this.CornerX + this.m_cam.width) < ((this.m_mainTerrain.x + this.STAGE.x) + this.m_mainTerrain.width))
            {
                this.m_cam.x = (this.m_cam.x + 15);
                this.syncPositions();
                this.m_cam.camControl();
            };
        }

        public function panUp():void
        {
            if (this.CornerY > (this.m_mainTerrain.y + this.STAGE.y))
            {
                this.m_cam.y = (this.m_cam.y - 15);
                this.syncPositions();
                this.m_cam.camControl();
            };
        }

        public function panDown():void
        {
            if ((this.CornerY + this.m_cam.height) < ((this.m_mainTerrain.y + this.STAGE.y) + this.m_mainTerrain.height))
            {
                this.m_cam.y = (this.m_cam.y + 15);
                this.syncPositions();
                this.m_cam.camControl();
            };
        }

        private function setBrightness(_arg_1:Number):void
        {
            if (Math.abs(_arg_1) > 100)
            {
                _arg_1 = ((_arg_1 > 0) ? 100 : -100);
            };
            var _local_2:ColorTransform = new ColorTransform();
            _local_2.redOffset = (_arg_1 * 2.55);
            _local_2.greenOffset = (_arg_1 * 2.55);
            _local_2.blueOffset = (_arg_1 * 2.55);
            this.STAGEPARENT.transform.colorTransform = _local_2;
        }

        public function maxZoomOut():void
        {
            this.m_cam.height = this.m_mainTerrain.height;
            this.m_cam.width = (this.m_cam.height * (this.m_originalWidth / this.m_originalHeight));
            this.m_cam.x = ((this.m_mainTerrain.x + (this.m_mainTerrain.width / 2)) + this.STAGE.x);
            this.m_cam.y = ((this.m_mainTerrain.y + (this.m_mainTerrain.height / 2)) + this.STAGE.y);
        }

        private function checkMode():void
        {
            if (this.m_mode == Vcam.STAGE_MODE)
            {
                this.maxZoomOut();
            }
            else
            {
                if (this.m_mode == Vcam.ZOOM_MODE)
                {
                    this.m_cam.width = (this.m_originalWidth / 3);
                    this.m_cam.height = (this.m_originalHeight / 3);
                };
            };
        }

        public function pauseBG():void
        {
            var _local_1:int;
            while (_local_1 < this.m_backgrounds.length)
            {
                this.m_backgrounds[_local_1].stop();
                Utils.recursiveMovieClipPlay(this.m_backgrounds[_local_1], false, false);
                _local_1++;
            };
        }

        public function playBG():void
        {
            var _local_1:int;
            while (_local_1 < this.m_backgrounds.length)
            {
                this.m_backgrounds[_local_1].play();
                Utils.recursiveMovieClipPlay(this.m_backgrounds[_local_1], true, false);
                _local_1++;
            };
        }

        public function showBGs():void
        {
            var _local_1:int;
            while (_local_1 < this.m_backgrounds.length)
            {
                this.m_backgrounds[_local_1].visible = true;
                _local_1++;
            };
        }

        public function hideBGs():void
        {
            var _local_1:int;
            while (_local_1 < this.m_backgrounds.length)
            {
                this.m_backgrounds[_local_1].visible = false;
                _local_1++;
            };
        }

        public function gotoAndPlayBG(_arg_1:String):void
        {
            var _local_2:int;
            if (_arg_1 != null)
            {
                _local_2 = 0;
                while (_local_2 < this.m_backgrounds.length)
                {
                    Utils.tryToGotoAndPlay(this.m_backgrounds[_local_2], _arg_1);
                    _local_2++;
                };
            };
        }

        public function nextFrameBG():void
        {
            var _local_1:int;
            while (_local_1 < this.m_backgrounds.length)
            {
                Utils.advanceFrame(this.m_backgrounds[_local_1]);
                Utils.recursiveMovieClipPlay(this.m_backgrounds[_local_1], true);
                _local_1++;
            };
        }

        public function PERFORMALL():void
        {
            if (((!(this.STAGEDATA.Paused)) && (!(this.m_dead))))
            {
                this.m_cam.camControl();
                if (this.m_mode == Vcam.STAGE_MODE)
                {
                    this.checkMode();
                    return;
                };
                this.getPositions();
                this.zoom();
                this.followTargets();
                this.checkMode();
                this.effects();
            };
        }


    }
}//package com.mcleodgaming.ssf2.util