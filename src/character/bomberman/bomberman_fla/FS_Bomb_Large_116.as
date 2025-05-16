// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.FS_Bomb_Large_116

package bomberman_fla
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

    public dynamic class FS_Bomb_Large_116 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;

        public function FS_Bomb_Large_116()
        {
            addFrameScript(0, this.frame1, 29, this.frame30, 30, this.frame31, 34, this.frame35);
        }

        public function explode(_arg_1:*=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.explode);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.explode);
            gotoAndPlay("explode");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.PROJ_COLLIDE, this.explode);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.explode);
            };
        }

        internal function frame30():*
        {
            gotoAndPlay("start");
        }

        internal function frame31():*
        {
            this.self.attachEffect("explosionNewPower");
            SSF2API.shakeCamera(10);
            SSF2API.playSound("bomberman_explode");
        }

        internal function frame35():*
        {
            this.self.destroy();
        }


    }
}//package bomberman_fla

