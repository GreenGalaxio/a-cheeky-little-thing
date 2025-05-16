// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_ledgeAttack_62

package bomberman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class Bomberman_ledgeAttack_62 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var damage:Number;

        public function Bomberman_ledgeAttack_62()
        {
            addFrameScript(0, this.frame1, 13, this.frame14, 17, this.frame18, 26, this.frame27, 27, this.frame28, 47, this.frame48);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame14():*
        {
            this.self.setIntangibility(false);
            this.damage = 0;
            this.damage = this.self.getDamage();
            if (this.damage >= 100)
            {
                gotoAndPlay("heavy");
            };
        }

        internal function frame18():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }

        internal function frame28():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "power":118,
                "kbConstant":13,
                "direction":50
            });
        }

        internal function frame48():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

