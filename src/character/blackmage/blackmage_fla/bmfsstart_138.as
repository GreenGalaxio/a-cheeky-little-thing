// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmfsstart_138

package blackmage_fla
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

    public dynamic class bmfsstart_138 extends MovieClip 
    {

        public var self:*;
        public var finished:Boolean;
        public var bounds:Object;

        public function bmfsstart_138()
        {
            addFrameScript(0, this.frame1, 18, this.frame19, 21, this.frame22, 24, this.frame25, 97, this.frame98, 490, this.frame491, 523, this.frame524, 571, this.frame572, 657, this.frame658, 705, this.frame706);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.finished = false;
                this.self.faceRight();
            };
        }

        internal function frame19():*
        {
            SSF2API.lightFlash();
            SSF2API.shakeCamera(20);
            SSF2API.playSound("bm_FS_start");
        }

        internal function frame22():*
        {
            SSF2API.shakeCamera(20);
        }

        internal function frame25():*
        {
            SSF2API.lightFlash();
        }

        internal function frame98():*
        {
            SSF2API.playSound("bm_FS_Escape");
        }

        internal function frame491():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame524():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame572():*
        {
            this.bounds = SSF2API.getDeathBounds();
            this.self.fireProjectile("flare");
            this.self.getCurrentProjectile().getMC().width = this.bounds.width;
            this.self.getCurrentProjectile().getMC().height = this.bounds.height;
            this.self.getCurrentProjectile().setX(this.bounds.x);
            this.self.getCurrentProjectile().setY(this.bounds.y);
        }

        internal function frame658():*
        {
            SSF2API.playSound("bm_FS_Escape");
        }

        internal function frame706():*
        {
            this.self.faceLeft();
            this.self.endAttack();
        }


    }
}//package blackmage_fla

