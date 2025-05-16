// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.mk_jump2_13

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class mk_jump2_13 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var done:Boolean;

        public function mk_jump2_13()
        {
            addFrameScript(0, this.frame1, 17, this.frame18, 18, this.frame19, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.done = false;
            };
        }

        internal function frame18():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }

        internal function frame19():*
        {
            SSF2API.playSound("mk_fullhop");
        }

        internal function frame31():*
        {
            this.done = true;
            gotoAndPlay("redo2");
        }


    }
}//package metaknight_fla

