// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_shield_199

package mario_fla
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

    public dynamic class mario_shield_199 extends MovieClip 
    {

        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function mario_shield_199()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 11, this.frame12);
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
                        this.self.importCPUControls([4099, 2, 6147, 1, 6209, 1, 4161, 2, 4097, 1]);
                    }
                    else
                    {
                        if (_local_2 < 0.4)
                        {
                            this.self.importCPUControls([4163, 2]);
                        }
                        else
                        {
                            if (_local_2 < 0.55)
                            {
                                this.self.importCPUControls([6179, 2]);
                            };
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
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("jab", false);
                this.self.setGlobalVariable("jab2", false);
            };
        }

        internal function frame11():*
        {
            stop();
        }

        internal function frame12():*
        {
            gotoAndPlay("pause");
        }


    }
}//package mario_fla

