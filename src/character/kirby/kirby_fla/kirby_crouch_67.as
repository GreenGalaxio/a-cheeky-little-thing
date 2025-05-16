// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_crouch_67

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class kirby_crouch_67 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function kirby_crouch_67()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame3():*
        {
            gotoAndPlay("redo");
        }

        internal function frame4():*
        {
            SSF2API.playSound("kirby_crouch2");
        }


    }
}//package kirby_fla

