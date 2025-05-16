// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_rasenEffect2

package 
{
    import flash.display.MovieClip;

    public dynamic class naruto_rasenEffect2 extends MovieClip 
    {

        public function naruto_rasenEffect2()
        {
            addFrameScript(12, this.frame13);
        }

        internal function frame13():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

