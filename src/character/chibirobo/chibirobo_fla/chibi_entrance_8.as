// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_entrance_8

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_entrance_8 extends MovieClip 
    {

        public var self:*;

        public function chibi_entrance_8()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 30, this.frame31);
        }

        public function fireTelly():void
        {
            SSF2API.print("Starting to fire telly");
            this.self.fireProjectile("telly_vision");
            this.self.setGlobalVariable("telly", this.self.getCurrentProjectile());
        }

        internal function frame1():*
        {
        }

        internal function frame2():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame31():*
        {
            if (this.self)
            {
                this.self.createTimer(1, -1, this.fireTelly, {
                    "condition":function ():Boolean
                    {
                        return (!(self.getGlobalVariable("telly")));
                    },
                    "persistent":true
                });
            };
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

