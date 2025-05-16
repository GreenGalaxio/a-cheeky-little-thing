// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkguard_72

package donkeykong_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class dkguard_72 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function dkguard_72()
        {
            addFrameScript(0, this.frame1, 3, this.frame4);
        }

        public function outOfShield(_arg_1:*=null):void
        {
            var _local_2:Number;
            if (_arg_1.data.caller == this.self)
            {
                if (((this.self.isCPU()) && (this.self.getCPULevel() >= 7)))
                {
                    _local_2 = SSF2API.random();
                    if (_local_2 < 0.25)
                    {
                        this.self.importCPUControls([4099, 10, 6147, 1, 6209, 1, 4161, 2, 4097, 1]);
                    }
                    else
                    {
                        if (_local_2 < 0.4)
                        {
                            this.self.importCPUControls([4163, 10]);
                        };
                    };
                };
            };
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if ((((parent) && (this.self)) && (SSF2API.isReady())))
            {
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_SHIELD_HIT, this.outOfShield);
            };
        }

        internal function frame4():*
        {
            gotoAndPlay("redo");
        }


    }
}//package donkeykong_fla

